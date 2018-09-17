SET @rownum := -1;
SELECT 
    round(avg(long_val.longi),4)
FROM
    (SELECT @rownum:=@rownum +1 as row_val,
          station.lat_n as longi
    FROM station
    ORDER BY longi) AS long_val
WHERE long_val.row_val IN (FLOOR(@rownum/2),CEIL(@rownum/2))