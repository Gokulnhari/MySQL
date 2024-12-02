create database company4;
use company4;

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


#1 Find the number of persons in each country.

SELECT Country_name, COUNT(*) AS NumberOfPersons FROM Persons GROUP BY Country_name;

#2 Find the number of persons in each country sorted from high to low. 

SELECT Country_name, COUNT(*) AS NumberOfPersons
FROM Persons
GROUP BY Country_name
ORDER BY NumberOfPersons DESC;

#3 Find out an average rating for Persons in respective countries if the average is greater than 3.0 

SELECT Country_name, AVG(Rating) AS AverageRating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;

#4 Find the countries with the same rating as the USA. (Use Subqueries)

SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');

SELECT DISTINCT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA' LIMIT 1);

#5 Select all countries whose population is greater than the average population of all nations.

update Persons set rating = 4.5 where Person_id = 9; 

SELECT Country_name, Population
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);

CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(50),
    Phone_no VARCHAR(15),
    Address VARCHAR(200),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

 #1 Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
 # Then perform the SELECT operation for the customer_info view.

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

SELECT * FROM customer_info;

#2 Create a view named US_Customers that displays customers located in the US. 

 CREATE VIEW US_Customers AS
SELECT * FROM Customer
WHERE Country = 'USA';

#3 Create a View Named Customer_details with Columns Full Name, Email, Phone Number, and State

CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email, Phone_no, State
FROM Customer;

# 4 Update Phone Numbers of Customers Who Live in California for Customer_details View
SET SQL_SAFE_UPDATES = 0;

UPDATE Customer
SET Phone_no = 'NEW_PHONE_NUMBER' 
WHERE State = 'California';

#5. Count the number of customers in each state and show only states with more than 5 customers.

SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

#6. Write a query that will return the number of customers in each state,
# based on the "state" column in the "customer_details" view.

SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

#7. Write a query that returns all the columns from the "customer_details" view,
 #sorted by the "state" column in ascending order.

SELECT *
FROM Customer_details
ORDER BY State ASC;







