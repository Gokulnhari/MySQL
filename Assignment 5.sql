create database company1;
use company1;

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

# 1 Print the first three characters of Country_name from the Country table

SELECT LEFT(Country_name, 3) AS First3Character FROM Country;

# 2 Concatenate first name and last name from Persons table:

SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

# 3 Count the number of unique country names from Persons table:

SELECT COUNT(DISTINCT Country_name) AS UniqueCountryNames FROM Persons;

# 4 Print the maximum population from the Country table:

SELECT MAX(Population) AS MaxPopulation FROM Country;

# 5 Print the minimum population from Persons table:

SELECT MIN(Population) AS MinPopulation FROM Persons;

# 6 Insert 2 new rows to the Persons table making the Lname NULL, then count Lname:

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Anna', NULL, 0, 3.6, 1, 'USA'),
(12, 'Tom', NULL, 0, 3.8, 2, 'Canada');

SELECT COUNT(Lname) AS CountLname FROM Persons;

# 7 Find the number of rows in the Persons table:

SELECT COUNT(*) AS NumberOfRows FROM Persons;

#8 Show the population of the Country table for the first 3 rows:

SELECT Population FROM Country LIMIT 3;

#9 Print 3 random rows of countries: 

SELECT * FROM Country ORDER BY RAND() LIMIT 3;

#10 List all persons ordered by their rating in descending order:

SELECT * FROM Persons ORDER BY Rating DESC;

# 11 Find the total population for each country in the Persons table:

SELECT Country_name, SUM(Population) AS TotalPopulation FROM Persons GROUP BY Country_name;

#12 Find countries in the Persons table with a total population greater than 50,000:

SELECT Country_name, SUM(Population) AS TotalPopulation FROM Persons GROUP BY Country_name HAVING SUM(Population) > 50000;

#13 List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order:

SELECT Country_name, COUNT(*) AS NumberOfPersons, AVG(Rating) AS AverageRating
FROM Persons GROUP BY Country_name HAVING COUNT(*) > 2 ORDER BY AverageRating ASC;



