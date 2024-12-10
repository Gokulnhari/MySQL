create database WorkerDB;
use WorkerDB;

create table worker(
Worker_Id INT(5) primary key,
FirstName CHAR(25),
LastName CHAR(25),
Salary INT(15),
JoiningDate DATETIME, 
Department CHAR(25));

INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES 
(1, 'John', 'Doe', 50000, '2022-01-01', 'HR'),
(2, 'Jane', 'Smith', 60000, '2021-06-15', 'Finance'),
(3, 'Alice', 'Johnson', 70000, '2020-09-30', 'IT'),
(4, 'Bob', 'Williams', 55000, '2019-12-20', 'Marketing'),
(5, 'Charlie', 'Brown', 52000, '2023-03-10', 'HR'),
(6, 'David', 'Jones', 75000, '2018-05-25', 'Finance'),
(7, 'Eve', 'Davis', 48000, '2021-11-03', 'IT'),
(8, 'Frank', 'Miller', 65000, '2022-02-18', 'Operations'),
(9, 'Grace', 'Wilson', 47000, '2020-07-07', 'Marketing'),
(10, 'Hank', 'Moore', 80000, '2017-10-12', 'Finance');

# 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 


DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

CALL AddWorker(1, 'Johnny', 'Doeson', 50000, '2024-12-09 14:48:00', 'IT');

select * from Worker;

#2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call. 

DELIMITER $$
CREATE PROCEDURE GetWorkerSalary (
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary FROM Worker WHERE Worker_Id = p_Worker_Id;
END $$
DELIMITER ;

SET @salary = 0;
CALL GetWorkerSalary(1, @salary);
SELECT @salary;

#3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.

DELIMITER $$
CREATE PROCEDURE UpdateWorkerDepartment (
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker SET Department = p_Department WHERE Worker_Id = p_Worker_Id;
END $$
DELIMITER ;

CALL UpdateWorkerDepartment(1, 'Finance');
SELECT * FROM Worker;

#4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 

DELIMITER $$
CREATE PROCEDURE GetWorkerCountByDepartment (
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount FROM Worker WHERE Department = p_Department;
END $$
DELIMITER ;

SET @workerCount = 0;
CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount;

#5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER $$
CREATE PROCEDURE GetAvgSalaryByDepartment (
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(15,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary FROM Worker WHERE Department = p_Department;
END $$
DELIMITER ;

SET @avgSalary = 0;
CALL GetAvgSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary;
