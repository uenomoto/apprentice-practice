START TRANSACTION;
INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES (500000, '1990-01-01', 'Taro', 'Yamada', 'M', '2023-05-01');
INSERT INTO salaries (emp_no, salary, from_date, to_date)
VALUES (500000, 60000, '2023-05-01', '9999-01-01');
COMMIT;


SELECT *
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
WHERE emp_no IN(500000) ;


SELECT *
FROM salaries
WHERE emp_no IN(500000) ;
