-- 서울에 위치한 식당 목록 출력하기
    SELECT RI.REST_ID, 
           RI.REST_NAME, 
           RI.FOOD_TYPE, 
           RI.FAVORITES, 
           RI.ADDRESS,
           RR.SCORE
      FROM REST_INFO RI,
           (SELECT REST_ID, ROUND(AVG(REVIEW_SCORE), 2) SCORE 
              FROM REST_REVIEW
          GROUP BY REST_ID) RR
     WHERE RI.REST_ID = RR.REST_ID
       AND RI.ADDRESS LIKE '서울%'
  ORDER BY RR.SCORE DESC, RI.FAVORITES DESC