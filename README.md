# Query_HR_Data_Lab

The human resources database consists of two tables: the departments table with the department_id column as the primary key and the employees table with the primary key as the employee_id column and the foreign key as the department_id column which is referenced from the departments table.

_1. The departments table is a departments table with the following columns:_
- department_id: department id
- department_name: Department name
- location_id: department location id

_2. The employees table is an employee table with the following columns:_
- employee_id: employee id
- first_name: Employee name
- last_name: Employee's last name
- email: Employee email
- phone_number: Employee phone number
- hire_date: Employee's joining date
- job_id: job id
- salary: Salary
- commission_pct: Commission
- manager_id: employee's manager id
- department_id: id of the department the employee works in

_3. Below are some HR data query requests_:
1. Query first_name, last_name, job_id and salary of employees whose names start with the letter "S"
2. Write a query to find the employees with the highest salary
3. Write a query to find the employees with the second largest salary. For example, if there are 5 employees whose salaries are 4, 4, 3, 3, 2, then the correct result for the second largest salary will be 3.3.
4. Write a query to find the employees with the third largest salary. Similar to request 3
5. Write a query to display employee salary along with corresponding manager, employee name and manager combined from first_name and last_name
6. Write a query to find the number of employees needed to manage each manager, manager name combined from first_name and last_name
7. Write a query to find the number of employees in each department arranged in descending order of employee number
8. Write a query to find the number of employees hired in each year sorted in descending order of employee salary and if the number of employees is equal then sort by year ascending
9. Write a query to get the largest, smallest and average salary of employees (round the average salary to an integer)
10. Write a query to divide employees into three groups based on salary, employee names are combined from first_name and last_name, results are sorted by name in ascending order
11. Write a query that displays employee full names and phone numbers in the format (_ _ _)-(_ _ _)-(_ _ _ _).
12. Write a query to find employees who joined in August 1994, employee names combined from first_name and last_name
13. Write a query to find employees whose salary is higher than the average salary of employees, sort the results in ascending order of department_id
14. Write a query to find the largest salary in each department, sorting the results in ascending order by department_id
15. Write a query to find the 5 employees with the lowest salary
16. Write a query to display employee names in reverse order
17. Write a query to find employees who joined after the 15th of the month
18. Write a query to find managers and employees working in different departments. The results are sorted in ascending order by manager name (employee and manager names combined from first_name and last_name)
