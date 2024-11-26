create database company2;
use company2;

CREATE TABLE Country (
    Country_Id INT primary key,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Person_Id INT primary key,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50)
);
INSERT INTO Country (Country_Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9834000),
(2, 'Canada', 38000000, 9985000),
(3, 'UK', 67800000, 243000),
(4, 'India', 1390000000, 3287000),
(5, 'Australia', 25600000, 7692000),
(6, 'Germany', 83000000, 357000),
(7, 'France', 67000000, 551000),
(8, 'China', 1440000000, 9597000),
(9, 'Japan', 125000000, 378000),
(10, 'Brazil', 213000000, 8516000);

ALTER TABLE Country RENAME COLUMN Country_Id to Id;
select * from country;

INSERT INTO Persons (person_Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
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

alter table Persons RENAME COLUMN Id to Person_Id;

select * from Country;
select * from Persons;

#1  Perform inner join, Left join, and Right join on the tables.

# Inner join

SELECT Persons.*, Country.Country_name, Country.Population, Country.Area
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;


#Left join 

 SELECT Persons.*, Country.Country_name, Country.Population, Country.Area
FROM Persons
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

# Right Join

SELECT Persons.*, Country.Country_name, Country.Population, Country.Area
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

#2 List all distinct country names from both the Country and Persons tables. 

 SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

#3 List all country names from both the Country and Persons tables,including duplicates.

SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

#4 Round the ratings of all persons to the nearest integer in the Persons table

SELECT Id, Fname, Lname, Population, ROUND(Rating) AS Rating, Country_Id, Country_name
FROM Persons;


