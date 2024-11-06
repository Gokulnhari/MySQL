create database School;
use School;

create table students (
 Roll_No INT PRIMARY KEY,
 Name varchar(20),
 Marks INT,
 Grade CHAR(1));
 
 insert into students ( Roll_No, Name, Marks, Grade) values (1,'aby',85,'B');
 insert into students ( Roll_No, Name, Marks, Grade) values(2,'ben',95,'A');
 insert into students ( Roll_No, Name, Marks, Grade) values(3,'john',97,'A');
 insert into students ( Roll_No, Name, Marks, Grade) values(4,'Bob',75,'C');
 
 select * from students;
 
 ALTER TABLE students ADD Contact VARCHAR(15);
 
 ALTER TABLE STUDENT DROP COLUMN Grade;
 
 ALTER TABLE STUDENT RENAME TO CLASSTEN;
 
 DELETE FROM CLASSTEN;
 
 DROP TABLE CLASSTEN;
 
 select * from students;
 
 
 