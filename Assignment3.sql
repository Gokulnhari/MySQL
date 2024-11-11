CREATE DATABASE Bank;
use Bank;

-- Create the Managers table

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(30),
    Last_Name VARCHAR(30),
    DOB DATE,
    Age INT CHECK (Age > 18),
    Last_update TIMESTAMP NOT NULL,
    Gender CHAR(1) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

-- 1. Insert 10 rows into the Managers table

insert into Managers values(1, 'John', 'Doe', '1980-01-01', 43, CURRENT_TIMESTAMP, 'M', 'IT', 30000),
(2, 'Jane', 'Smith', '1975-05-15', 48, CURRENT_TIMESTAMP, 'F', 'HR', 28000), 
(3, 'Emily', 'Davis', '1983-02-20', 40, CURRENT_TIMESTAMP, 'F', 'Finance', 32000), 
(4, 'Michael', 'Brown', '1990-08-10', 33, CURRENT_TIMESTAMP, 'M', 'IT', 26000), 
(5, 'Aaliya', 'Khan', '1985-11-25', 38, CURRENT_TIMESTAMP, 'F', 'Marketing', 27000), 
(6, 'Raj', 'Patel', '1978-03-30', 45, CURRENT_TIMESTAMP, 'M', 'IT', 35000), 
(7, 'Sara', 'Johnson', '1992-12-12', 31, CURRENT_TIMESTAMP, 'F', 'HR', 24000), 
(8, 'Chris', 'Lee', '1987-07-07', 36, CURRENT_TIMESTAMP, 'M', 'Sales', 31000), 
(9, 'Anna', 'Taylor', '1982-06-18', 41, CURRENT_TIMESTAMP, 'F', 'Finance', 29000), 
(10, 'David', 'Martinez', '1989-09-23', 34, CURRENT_TIMESTAMP, 'M', 'IT', 33000);

-- 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1

SELECT First_name, Last_Name, DOB FROM Managers WHERE Manager_Id = 1;

-- 3. Write a query to display the annual income of all managers 

SELECT First_name, Last_Name, Salary * 12 AS Annual_Income FROM Managers;

-- 4. Write a query to display records of all managers except 'Aaliya' 

SELECT * FROM Managers WHERE First_name <> 'Aaliya';

-- 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month 

SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

-- 6. Write a query to display details of managers whose salary is between 10000 and 35000

SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;

