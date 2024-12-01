create database company3;
use company3;

CREATE TABLE Country (
    Id INT primary key,
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
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
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

# 1. Add a new column called DOB in Persons table with data type as Date. 

alter table persons add DOB date ;

# 2. Write a user-defined function to calculate age using DOB.

DELIMITER $$
CREATE FUNCTION CalculateAge (DOB DATE)
RETURNS INT
deterministic
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    IF DATE_FORMAT(DOB, '%m-%d') > DATE_FORMAT(CURDATE(), '%m-%d') THEN
        SET Age = Age - 1;
    END IF;
    RETURN Age;
END $$

DELIMITER ;

#3 Write a select query to fetch the Age of all persons using the function that has been created.

SELECT Person_Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age FROM Persons;



#4 Find the length of each country name in the Country table. 

SELECT Country_name, length((Country_name)) AS NameLength
FROM Country;

#5 Extract the first three characters of each country's name in the Country table. 

SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;

#6  Convert all country names to uppercase and lowercase in the Country table.

SELECT Country_name, UPPER((Country_name)) AS UpperCaseName
FROM Country;



