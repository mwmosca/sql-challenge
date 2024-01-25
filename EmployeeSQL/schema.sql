CREATE TABLE IF NOT EXISTS departments(
	dept_no CHAR(4) PRIMARY KEY,
	dept_name VARCHAR NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS titles(
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS employees(
	emp_no INT PRIMARY KEY,
	emp_title_id CHAR(5),
		FOREIGN KEY(emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS dept_emp(
	emp_no INT,
		FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	dept_no CHAR(4),
		FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS dept_manager(
	dept_no CHAR(4),
		FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	emp_no INT,
		FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS salaries(
	emp_no INT PRIMARY KEY,
		FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	salary INT NOT NULL
);
