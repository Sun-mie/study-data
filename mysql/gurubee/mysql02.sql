CREATE TABLE DEPT(
  DEPNO INT,
  DNAME VARCHAR(20),
  ADDRESS VARCHAR(20)
);

INSERT INTO DEPT VALUES(20, '경영', '서울');
INSERT INTO DEPT VALUES(21, '영업', '경기');
INSERT INTO DEPT VALUES(22, '제조', '부산');

-- SQUI JOIN 
SELECT E.EMPNO, E.ENAME, D.DNAME FROM DEPT D, EMP E WHERE D.DEPNO = E.DEPNO;

-- SELF JOIN
SELECT E.ENAME, B.JOB FROM EMP E, EMP B WHERE E.DEPNO = 20;



-- EQUIT JOIN과 OUTER JOIN 비교
SELECT DISTINCT(E.DEPNO), D.DEPNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPNO = D.DEPNO ;

-- OUTER JOIN은 조건에 만족하지 않아도 나온다.
SELECT DISTINCT(E.DEPNO), D.DEPNO
FROM DEPT D
LEFT JOIN EMP E
ON E.DEPNO = D.DEPNO ;

-- CROSS JOIN
SELECT EMPNO, ENAME, DNAME FROM EMP CROSS JOIN DEPT ORDER BY ENAME DESC;

-- CROSS JOIN : CARTESIAN PRODUCT 값을 얻을 수 있다.
SELECT E.EMPNO, E.ENAME, D.DNAME FROM DEPT D CROSS JOIN EMP E;

-- NATURAL JOIN : 동일한 이름을 가지는 칼럼 모두 조인
SELECT EMPNO, ENAME, DEPNO, DNAME FROM EMP NATURAL JOIN DEPT;

-- JOIN ~USING 컬럼을 선택해서 조인
SELECT E.EMPNO, E.ENAME, DEPNO, D.DNAME FROM EMP E JOIN DEPT D USING(DEPNO);

-- ON : 조인 조건을 지정할 수 있다.
SELECT E.EMPNO, E.ENAME, E.SAL 
FROM EMP E 
JOIN DEPT D ON (E.DEPNO = D.DEPNO)
WHERE E.SAL IS NOT NULL;

-- 숫자형 함수
-- ABS(n) : 절대값
SELECT ABS (-1.234) absolute FROM DUAL;

-- CEIL(N) : 올림값
SELECT CEIL(10.1234) "CEIL" FROM DUAL;

-- FLOOR(N) : 버림값
SELECT FLOOR(-10.1234) "FLOOR" FROM DUAL; 
SELECT FLOOR(10.1234) "FLOOR" FROM DUAL;

-- MOD(M,N) M을 N으로 나눈 나머지 반환 (%)
SELECT MOD(9,4) "MOD" FROM DUAL;

-- ROUND(N, [M]) N값의 반올림을 하는 함수 M은 소숫점 아래 자릿수
SELECT ROUND(192.153, 1) "ROUND" FROM DUAL;

-- TRUNCATE(N, M) N값을 절삭 M은 소숫점 아래 자릿수
SELECT TRUNCATE(7.5597, 2) "TRUNCATE" FROM DUAL;


-- 문자형 함수
-- CONCAT
SELECT CONCAT('WWW.', 'MYSQL') NAME FROM DUAL;


-- upper 주어진 물자열의 문자를 대문자로 변환시켜 준다.
SELECT upper('mysql') FROM DUAL;
-- LOWER 주어진 문자열의 문자를 소문자로 변형시킴
SELECT lower('MYSQL') FROM DUAL;


-- LPAD 왼쪽에 문자열을 끼어 놓는 역할
SELECT LPAD('MYSQL', 12, '*') NAME FROM DUAL;
-- RPAD 오른쪽에 문자열을 끼어 놓는 역할
SELECT RPAD('MYSQL', 12, '*') NAME FROM DUAL;

-- SUBSTR(CHAR, M, [N]) M번째 자리부터 길이가 N개인 문자열을 반환
SELECT SUBSTR('MYSQL & ORACLE', 5) NAME FROM DUAL;
SELECT SUBSTR('MYSQL & ORACLE', 5, 8) NAME FROM DUAL;
-- SUBSTRING(CHAR, M, [N])
SELECT SUBSTRING('MYSQLL', 2) NAME FROM DUAL;

-- LENGTH(CHAR) 문자열의 길이 반환
SELECT LENGTH('MYSQL') LEN FROM DUAL;

-- REPLACE(CHAR, STR1, STR2) 문자열의 특정 문자를 다른 문자로 변환
SELECT REPLACE('MYSQL', 'MY', 'db') name FROM DUAL;

-- INSTR(CHAR, STR, M, N) 문자열이 포함되어 있는지 조사 후 문자열 위치 반환
SELECT INSTR('CORPORATE FLOOR', 'OK') IDX FROM DUAL;
SELECT INSTR('CORPORATE FLLOR', 'OR') IDX FROM DUAL;

-- TRIM(CHAR1[,VHAR2]) 특정 문자 제거 입력없을 댄 공백 제고
-- LTRIM(CHAR1[,CHAR2]) 왼쪽부터 제거
-- RTRIM(CHAR1[,CHAR2]) 오른쪽부터 제거
SELECT TRIM('o' FROM 'oraclecool') name FROM DUAL;
SELECT LTRIM('      MYSQSL       /') NAME FROM DUAL;
SELECT RTRIM('      MYSQL      ') NAME FROM DUAL;

-- 날짜 함수
-- DATE_FORMAT(날짜, 포맷) 현재 일자와 시간을 얻을 수 있다.
SELECT DATE_FORMAT(NOW(), '%Y년 %m월 %e일 %H시 %i분');

-- SYSTIMESTAMP 현재 일자와 시간
SELECT SYSDATE(); -- 해당 함수가 호출되는 시간의 값
SELECT NOW(); -- 쿼리가 실행되는 시간의 값

-- DDATE_ADD 현재 시간에 더하기
SELECT DATE_ADD(NOW(), INTERVAL 1 DAY);
SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH);
SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR);

-- DATEDIFF 일 차이
SELECT DATEDIFF(NOW(), '2023-02-14');

-- TIMESTAMPDIFF연,분기 등 차이
SELECT TIMESTAMPDIFF(MONTH, NOW(), '2023-05-05');

-- date_add(date, interval, expr unit) 날짜 더하기
SELECT date_add(now(), INTERVAL 1 day);

-- DATE_SUB 데이터 빼기
SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH);

-- LAST_DAT(D) 해당 달의 마지막 날 반환
SELECT NOW() TODAY, LAST_DAY('2023-03-01') FROM DUAL;

-- ROUND(D[F,]) 반올림
SELECT ROUND(25.36, 1) FROM DUAL;

-- 변환함수
-- DATE_FORMAT 날짜타입을 특정한 순서와 조합의 문자열을 생성한다.
SELECT DATE_FORMAT('2023-05-04 20:23:01', '%Y%m%d') ;

-- STR_TO_DATE : 문자열을 날짜형식으로 변환
SELECT STR_TO_DATE('20230215', '%Y %m %d');

-- CAST('' AS INTEGER) AS 타입변환
SELECT CAST('20230215' AS DATE);
SELECT CAST(12253 AS CHAR);
SELECT CAST('256980' AS SIGNED); -- INTEGER
-- CONVERT 타입변환
SELECT CONVERT(NOW(), CHAR);
SELECT CONVERT(20230215, DATE);
SELECT CONVERT('258654', SIGNED); -- INTEGER

