create database Population;
use Population;

CREATE TABLE Country (
    Id INT primary key,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT primary key,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50)
);
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331001234, 9834913),
(2, 'Canada', 3808732, 99852648),
(3, 'UK', 678015432, 2439125),
(4, 'India', 1390091283, 3288100),
(5, 'Australia', 256004328, 7692221),
(6, 'Germany', 830091823, 3570847),
(7, 'France', 670023867, 5510125),
(8, 'China', 1440091023, 9599280),
(9, 'Japan', 125000000, 378000),
(10, 'Brazil', 213000000, 8516000);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 0, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 0, 4.7, 2, 'Canada'),
(3, 'Mary', 'Johnson', 0, 3.9, 3, 'UK'),
(4, 'James', 'Brown', 0, 4.2, 4, 'India'),
(5, 'Patricia', 'Davis', 0, 4.8, 5, 'Australia'),
(6, 'Robert', 'Garcia', 0, 3.5, 6, 'Germany'),
(7, 'Linda', 'Martinez', 0, 4.1, 7, 'France'),
(8, 'Michael', 'Rodriguez', 0, 4.6, 8, 'China'),
(9, 'William', 'Hernandez', 0, 4.3, 9, 'Japan'),
(10, 'Barbara', 'Wilson', 0, 4.0, 10, 'Brazil');

#1 List the distinct country names from the Persons table

SELECT DISTINCT Country_name FROM Persons;

#2 Select first names and last names from the Persons table with aliases

SELECT Fname AS First_Name, Lname AS Last_Name FROM Persons;

#3 Find all persons with a rating greater than 4.0

SELECT * FROM Persons WHERE Rating > 4.0;

#4 Find countries with a population greater than 10 lakhs

SELECT * FROM Country WHERE Population > 1000000;

#5 Find persons who are from 'USA' or have a rating greater than 4.5 

SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

#6 Find all persons where the country name is NULL

SELECT * FROM Persons WHERE Country_name IS NULL;

#7 Find all persons from the countries 'USA', 'Canada', and 'UK'

SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

#8 Find all persons not from the countries 'India' and 'Australia'

SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

#9 Find all countries with a population between 5 lakhs and 20 lakhs

SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

#10 Find all countries whose names do not start with 'C'

SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';








