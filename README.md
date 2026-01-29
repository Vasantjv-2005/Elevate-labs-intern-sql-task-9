# Task 9 – Subqueries in MySQL

## Objective

The purpose of this task is to understand and practice SQL subqueries using the employees_fk table.  
This task focuses on comparing salaries, using nested queries, and analyzing how subqueries behave in different clauses.

---

## Tables Used

employees_fk

Columns:

- emp_id
- full_name
- email
- salary
- department_id

---

## What Was Practiced

1. Created salary data inside the employees_fk table.
2. Used a subquery to find employees earning more than the average salary.
3. Applied subqueries in:
   - WHERE clause
   - FROM clause
   - SELECT clause
4. Compared subquery results with JOIN-based queries.
5. Implemented correlated subqueries.
6. Observed execution flow of nested queries.
7. Identified situations where subqueries are necessary.
8. Debugged syntax errors related to incomplete SQL statements.

---

## Key Queries

### Find Average Salary

SELECT AVG(salary) FROM employees_fk;

---

### Employees Earning More Than Average (Subquery in WHERE)

SELECT emp_id, full_name, salary
FROM employees_fk
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_fk
);

---

### Subquery in FROM Clause

SELECT *
FROM
(
    SELECT emp_id, full_name, salary
    FROM employees_fk
) AS emp_table;

---

### Subquery in SELECT Clause

SELECT emp_id,
       full_name,
       salary,
       (SELECT AVG(salary) FROM employees_fk) AS avg_salary
FROM employees_fk;

---

### JOIN Based Alternative

SELECT e.emp_id, e.full_name, e.salary
FROM employees_fk e
JOIN
(
    SELECT AVG(salary) AS avg_salary
    FROM employees_fk
) a
ON e.salary > a.avg_salary;

---

### Correlated Subquery Example

SELECT emp_id, full_name, salary
FROM employees_fk e1
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees_fk e2
    WHERE e2.department_id = e1.department_id
);

---

## Important Learnings

- WHERE cannot be executed alone; it must always follow SELECT and FROM.
- Subqueries must return a single value when used with comparison operators.
- Correlated subqueries run once per row and are slower than normal subqueries.
- JOIN queries are usually faster than correlated subqueries.
- Subqueries are useful when aggregated results are required inside filters.

---

## Common Error Faced

Error Code 1064 occurred because only the WHERE clause was executed.

Correct format:

SELECT ...
FROM ...
WHERE ...

Never run WHERE by itself.

---

## Real World Use Case

Subqueries are commonly used for:

- Finding employees earning above company average
- Department-wise salary comparison
- Filtering records based on aggregated values
- Reports requiring nes
::contentReference[oaicite:0]{index=0}

