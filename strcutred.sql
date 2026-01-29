USE intern_training_db;

-- -------------------------------------------------
-- View all employees with salary
-- -------------------------------------------------

SELECT emp_id, full_name, salary
FROM employees_fk;

-- -------------------------------------------------
-- Find average salary
-- -------------------------------------------------

SELECT AVG(salary) AS average_salary
FROM employees_fk;

-- -------------------------------------------------
-- Employees earning more than average salary
-- Subquery in WHERE
-- -------------------------------------------------

SELECT emp_id, full_name, salary
FROM employees_fk
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_fk
);

-- -------------------------------------------------
-- Subquery inside FROM clause
-- -------------------------------------------------

SELECT *
FROM (
    SELECT emp_id, full_name, salary
    FROM employees_fk
) AS emp_table;

-- -------------------------------------------------
-- Subquery inside SELECT clause
-- -------------------------------------------------

SELECT 
    emp_id,
    full_name,
    salary,
    (SELECT AVG(salary) FROM employees_fk) AS average_salary
FROM employees_fk;

-- -------------------------------------------------
-- JOIN based version of above (comparison)
-- -------------------------------------------------

SELECT e.emp_id, e.full_name, e.salary
FROM employees_fk e
JOIN
(
    SELECT AVG(salary) AS avg_salary
    FROM employees_fk
) a
ON e.salary > a.avg_salary;

-- -------------------------------------------------
-- Correlated subquery example
-- Employees earning more than department average
-- -------------------------------------------------

SELECT emp_id, full_name, salary, department_id
FROM employees_fk e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_fk
    WHERE department_id = e.department_id
);

-- -------------------------------------------------
-- Debugging example
-- Check NULL salaries
-- -------------------------------------------------

SELECT *
FROM employees_fk
WHERE salary IS NULL;
