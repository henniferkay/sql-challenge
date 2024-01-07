/***
Query name: schemata.sql
Purpose: to create a table schema for each of the csv files of a company's employee data
***/

CREATE TABLE departments (
    dept_no varchar(4) PRIMARY KEY NOT NULL,
    dept_name text NOT NULL
);

CREATE TABLE dept_emp (
    emp_no integer NOT NULL,
    dept_no varchar(4) NOT NULL
);

CREATE TABLE dept_manager (
    dept_no varchar(4) NOT NULL,
    emp_no integer NOT NULL
);

CREATE TABLE employees (
    emp_no integer PRIMARY KEY NOT NULL,
    emp_title_id varchar(5) NOT NULL,
    birth_date date,
    first_name text NOT NULL,
    last_name text NOT NULL,
    sex varchar(1) NOT NULL,
    hire_date date
);

CREATE TABLE salaries (
    emp_no integer PRIMARY KEY NOT NULL,
    salary integer NOT NULL
);

CREATE TABLE titles (
    title_id varchar(5) PRIMARY KEY NOT NULL,
    title varchar(20) NOT NULL
);

ALTER TABLE dept_emp 
	ADD CONSTRAINT dept_no_fk FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	ADD CONSTRAINT emp_no_fk FOREIGN KEY(emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager 
	ADD CONSTRAINT dept_no_fk FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	ADD CONSTRAINT emp_no_manager_fk FOREIGN KEY(emp_no) REFERENCES employees(emp_no);

ALTER TABLE employees
	ADD CONSTRAINT emp_no_salaries_fk FOREIGN KEY(emp_no) REFERENCES salaries(emp_no),
	ADD	CONSTRAINT title_id_fk FOREIGN KEY(emp_title_id) REFERENCES titles(title_id);