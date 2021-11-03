select STORE_ID,STORE_NAME,SALES from STORE_INFORMATION;

select * from STORE_INFORMATION;

SELECT DISTINCT STORE_NAME FROM STORE_INFORMATION;

select DISTINCT STORE_ID,STORE_NAME,SALES from STORE_INFORMATION;

select * from STORE_INFORMATION
WHERE SALES >= 1500;

select * from STORE_INFORMATION
WHERE SALES >= 1500 AND STORE_DATE = '2018/5/15';

select * from STORE_INFORMATION
WHERE SALES >= 1500 OR STORE_DATE = '2018/3/9';

select * from STORE_INFORMATION
WHERE STORE_ID = 1 OR STORE_ID = 2 OR STORE_ID = 3;

-- IN 參數個數上限一千個
select * from STORE_INFORMATION
WHERE STORE_ID  IN ( 1,2,3 );

select * from STORE_INFORMATION
WHERE STORE_NAME  IN ( 'Boston','San Diego' );

select * from STORE_INFORMATION
WHERE SALES BETWEEN  250 AND 700 ;

select * from STORE_INFORMATION
WHERE STORE_DATE BETWEEN  '2018-01-01' AND '2018-03-31' ;

SELECT STORE_NAME from STORE_INFORMATION
WHERE STORE_NAME LIKE 'Los%';

SELECT * FROM  STORE_INFORMATION
WHERE STORE_NAME LIKE '%!%%' ESCAPE '!';

SELECT * FROM  STORE_INFORMATION
WHERE STORE_NAME LIKE '%%%';


-- 1.「且」找出屬於西區的商店
-- •2.「且」營業額大於300(包含300)
-- •3.「且」商店名稱“L”開頭
-- •4.「或」營業日介於2018年3月至4月
select * from STORE_INFORMATION
WHERE GEOGRAPHY_ID = '2' AND SALES >=300 AND STORE_NAME LIKE 'L%'OR STORE_DATE BETWEEN  '2018-03-01' AND '2018-04-30';

select * from STORE_INFORMATION
ORDER BY SALES DESC, STORE_DATE ASC;

select SUM(SALES) from STORE_INFORMATION;

select SUM(SALES),COUNT(STORE_ID),AVG(SALES),MAX(SALES),MIN(SALES) from STORE_INFORMATION;

select * from STORE_INFORMATION
WHERE GEOGRAPHY_ID IS NULL;

select COUNT(STORE_ID) from STORE_INFORMATION
WHERE GEOGRAPHY_ID IS NOT NULL;

select COUNT(DISTINCT STORE_NAME) from STORE_INFORMATION;




