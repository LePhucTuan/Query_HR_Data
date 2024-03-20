-- 1. Query first_name, last_name, job_id and salary of employees whose names start with the letter "S" 
SELECT first_name, last_name, job_id, salary FROM employees WHERE first_name LIKE "S%";

-- 2. The query finds the employees with the highest salary
SELECT employee_id, first_name, last_name,job_id, salary FROM employees ORDER BY salary DESC LIMIT 1;

-- 3. The query finds the employees with the second largest salary
SELECT employee_id, first_name, last_name,job_id, salary FROM employees 
WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

-- 4. The query finds the employees with the third largest salary
-- Create a variable that stores the second largest number of employee salaries
SET @salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

SELECT employee_id, first_name, last_name,job_id, salary FROM employees 
WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < @salary);

-- 5. The query displays the employee's salary along with the corresponding manager,
-- employee and manager names combined from first_name and last_name
SELECT 
	CONCAT(e.first_name, ' ', e.last_name) AS employee, 
	e.salary AS emp_sal, 
	CONCAT(m.first_name, ' ', m.last_name) AS manager, 
	m.salary AS mgr_sal
FROM employees AS e
JOIN employees AS m ON m.employee_id = e.manager_id;

-- 6. The query finds the number of employees each manager needs to manage,
-- manager name combined from first_name and last_name
SELECT
	m.employee_id,
	CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
	COUNT(e.employee_id) AS numer_of_reportees
FROM employees AS e
JOIN employees AS m ON e.manager_id = m.employee_id
GROUP BY m.employee_id, manager_name
ORDER BY numer_of_reportees DESC;

-- 7. The query finds the number of employees in each department arranged in descending order of employee number
SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM departments AS d
JOIN employees AS e ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY emp_count DESC;

-- 8. The query finds the number of employees hired each year, sorted in descending order of employee salary
-- and if the number of employees is equal, sort by year ascending
SELECT YEAR(hire_date) AS hired_year, COUNT(*) AS employees_hired_count
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY employees_hired_count DESC, hired_year ASC;

-- 9. The query retrieves the largest, smallest, and average salary of
-- employees (round average salary to whole number)
SELECT MIN(salary) AS min_sal, MAX(salary) as max_sal, ROUND(AVG(salary),0) AS avg_sal
FROM employees;

-- 10. The query divides employees into three groups based on salary,
-- employee name is a combination of first_name and last_name, the results are sorted by name in ascending order
SELECT CONCAT(first_name, ' ', last_name) AS employee, salary,
CASE
	WHEN salary >= 2000 AND salary < 5000 THEN 'low'
	WHEN salary >= 5000 AND salary < 10000 THEN 'mid'
	ELSE 'high'
END AS salary_level
FROM employees
ORDER BY employee;

-- 11. The query displays the employee's full name and phone number in the format (_ _ _)-(_ _ _)-(_ _ _ _)
SELECT CONCAT(first_name, ' ', last_name) AS employee, 
REPLACE(phone_number, '.', '-') AS phone_number
FROM employees;

-- 12. The query finds employees who joined in August 1994
SELECT CONCAT(first_name, ' ', last_name) AS employee, hire_date
FROM employees
WHERE hire_date BETWEEN '1994-08-01' AND '1994-08-31';

 -- 13. The query finds employees whose salary is higher than the average salary of employees,
-- results sorted in ascending order by department_id
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS name,
	e.employee_id,
	d.department_name AS department,
	d.department_id,
	e.salary
FROM employees AS e
JOIN departments AS d ON e.department_id=d.department_id
WHERE e.salary > (SELECT AVG(salary) FROM employees)
ORDER BY d.department_id;

-- 14. The query finds the largest salary in each department, the results are sorted in ascending order by department_id
SELECT
	d.department_id,
	d.department_name AS department,
	MAX(e.salary) AS maximum_salary
FROM employees AS e
JOIN departments AS d ON e.department_id=d.department_id
GROUP BY department, department_id
ORDER BY d.department_id;

-- 15. The query finds the 5 employees with the lowest salary
SELECT first_name, last_name, employee_id, salary
FROM employees
ORDER BY salary ASC LIMIT 5;

-- 16. Câu truy vấn hiển thị tên nhân viên theo thứ tự ngược lại
SELECT LOWER(first_name) AS name, REVERSE(LOWER(first_name)) AS reversed
FROM employees;

-- 17. The query finds employees who joined after the 15th of the month
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS employee, hire_date
FROM employees
WHERE DAY(hire_date) > 15;

-- 18. The query finds managers and employees working in different departments,
-- results sorted in ascending order by manager name
SELECT
	CONCAT(m.first_name, ' ',m.last_name) AS managers,
	CONCAT(e.first_name, ' ',e.last_name) AS employee,
	m.department_id AS mgr_dept,
	e.department_id AS emp_dept
FROM employees AS e
JOIN employees AS m ON e.manager_id = m.employee_id
WHERE e.department_id <> m.department_id
ORDER BY managers;



