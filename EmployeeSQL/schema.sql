-- Title id is unique and not repeatable.
CREATE TABLE titles (
    title_id VARCHAR(50) PRIMARY KEY NOT NULL,
    title VARCHAR(255) NOT NULL
);

-- Employee number is unique and not repeatable.
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(50) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Department number is unique and not repeatable.
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(255) NOT NULL
);

-- Some people might have same employee number but worked in different positions.
-- So that, this will be a composite key.
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Same departments can have different managers. So that, this will be a composite key.
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Some people might have same employee number but worked in different positions (different salary as well).
-- So that, this will be a composite key.
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary FLOAT NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);