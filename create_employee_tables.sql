
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


CREATE TABLE departments (
dept_no VARCHAR(200) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(200) NOT NULL
);

CREATE TABLE dept_emp (
emp_no INT NOT NULL PRIMARY KEY,
	dept_no VARCHAR(200) NOT NULL
);

CREATE TABLE dept_manager (
dept_no VARCHAR(200) NOT NULL,
	emp_no INT NOT NULL PRIMARY KEY
);

CREATE TABLE employees (
emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(200) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(200) NOT NULL,
	last_name VARCHAR(200) NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries (
emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL
);

CREATE TABLE titles (
title_id VARCHAR(200) NOT NULL PRIMARY KEY, 
	title VARCHAR(200) NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");



SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
