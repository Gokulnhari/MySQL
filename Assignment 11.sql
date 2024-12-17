CREATE DATABASE school_db1;
USE school_db1;

-- Step 1: Create the teachers table and insert 8 rows
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) VALUES (1, 'John Doe', 'Mathematics', 5, 45000.00);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES (2, 'Jane Smith', 'Physics', 8, 48000.00);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES (3, 'Emily Johnson', 'Chemistry', 3, 42000.00);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES (4, 'Michael Brown', 'Biology', 10, 47000.00);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES (5, 'Emma Wilson', 'English', 7, 46000.00);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES (6, 'William Jones', 'History', 6, 45000.00);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES (7, 'Olivia Davis', 'Geography', 4, 44000.00);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES (8, 'Liam Martin', 'Computer Science', 9, 49000.00);

-- Step 2: Create a before insert trigger to raise error if salary is negative
DELIMITER &&

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END &&

DELIMITER ;

-- Step 3: Create an after insert trigger to log the insertion action
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER &&

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END &&

DELIMITER ;

-- Step 4: Create a before delete trigger to raise error if experience is greater than 10 years
DELIMITER &&

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END &&

DELIMITER ;

-- Step 5: Create an after delete trigger to log the deletion action
DELIMITER &&

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END &&

DELIMITER ;
