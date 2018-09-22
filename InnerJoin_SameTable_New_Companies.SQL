SELECT a.company_code,a.founder,count(distinct e.lead_manager_code),count(distinct e.senior_manager_code), count(distinct e.manager_code),count(distinct e.employee_code) 
FROM company a 
INNER JOIN employee e ON a.company_code = e.company_code
GROUP BY a.company_code,a.founder
ORDER BY a.company_code