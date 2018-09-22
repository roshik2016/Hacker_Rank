SET @row = 0;
SET @row1 = 0;
SET @row2 = 0;
SET @row3 = 0;

SELECT tb11.doc_names,tb11.prof_names, tb12.singer_names, tb12.actor_names FROM 

(SELECT tb1.num AS nums, tb1.doc_name AS doc_names, tb2.prof_name AS prof_names FROM
(SELECT @row := @row + 1 AS num, CASE WHEN occupation = "Doctor" THEN name END AS doc_name FROM occupations order by ISNULL(doc_name), doc_name) as tb1
INNER JOIN
(SELECT @row1 := @row1 + 1 AS num, CASE WHEN occupation ="Professor" THEN name END as prof_name FROM occupations order by ISNULL(prof_name), prof_name) as tb2
ON tb1.num = tb2.num) AS tb11

INNER JOIN

(SELECT tb3.num AS nums, tb3.singer_name AS singer_names, tb4.actor_name AS actor_names FROM
(SELECT @row2 := @row2 + 1 AS num, CASE WHEN occupation = "Singer" THEN name END AS singer_name FROM occupations order by ISNULL(singer_name), singer_name) as tb3
INNER JOIN
(SELECT @row3 := @row3 + 1 AS num, CASE WHEN occupation ="Actor" THEN name END as actor_name FROM occupations order by ISNULL(actor_name), actor_name) as tb4
ON tb3.num = tb4.num) AS tb12

ON tb11.nums = tb12.nums         

WHERE tb11.nums <= (SELECT max(max_val) FROM (SELECT count(occupation) as max_val from Occupations group by occupation) as a)
