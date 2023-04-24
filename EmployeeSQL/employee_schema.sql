DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Salaries;

CREATE TABLE Departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE Titles (
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(255) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title VARCHAR(5),
	birth_date VARCHAR(10),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(1),
	hire_date VARCHAR(10),
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES Titles(title_id)
);

CREATE TABLE Dept_Emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE Dept_Manager (
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no)
);

