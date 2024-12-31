CREATE DATABASE library;
USE library;

-- Step 1: Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(15)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) 
VALUES (1, 101, '123 Main St, CityA', '1234567890'),
(2, 102, '456 Oak St, CityB', '2345678901'), 
(3, 103, '789 Pine St, CityC', '3456789012');

-- Step 2: Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) 
VALUES (101, 'Alice Smith', 'Manager', 60000, 1), 
(102, 'Bob Johnson', 'Manager', 55000, 2), 
(103, 'Charlie Brown', 'Manager', 65000, 3), 
(104, 'David Wilson', 'Staff', 45000, 1),
(105, 'Eve Davis', 'Staff', 40000, 2),
(106, 'Frank Miller', 'Staff', 47000, 3);

-- Step 3: Create the Books table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES (111, 'Mathematics for Beginners', 'Education', 30.00, 'yes', 'John Doe', 'EduPub'), 
(112, 'Advanced Physics', 'Science', 40.00, 'yes', 'Jane Doe', 'SciPub'), 
(113, 'History of Civilizations', 'History', 25.00, 'no', 'Alice Wonder', 'HistPub'), 
(114, 'Introduction to Biology', 'Science', 35.00, 'yes', 'Bob Stone', 'BioPub'), 
(115, 'Modern Chemistry', 'Science', 45.00, 'no', 'Charlie Adams', 'ChemPub'), 
(116, 'World Literature', 'Arts', 50.00, 'yes', 'David Frost', 'ArtPub');

-- Step 4: Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) 
VALUES (201, 'Michael Scott', '123 Maple St, CityA', '2021-12-15'), 
(202, 'Jim Halpert', '456 Elm St, CityB', '2020-11-20'), 
(203, 'Pam Beesly', '789 Cedar St, CityC', '2023-06-25'), 
(204, 'Dwight Schrute', '101 Birch St, CityA', '2021-01-10'), 
(205, 'Angela Martin', '202 Pine St, CityB', '2022-05-18'), 
(206, 'Kevin Malone', '303 Oak St, CityC', '2020-09-05');

-- Step 5: Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) 
VALUES (301, 201, 'Mathematics for Beginners', '2023-06-01', 111), 
(302, 202, 'Advanced Physics', '2023-06-05', 112), 
(303, 203, 'Introduction to Biology', '2023-06-10', 114);

-- Step 6: Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) 
VALUES (401, 201, 'Mathematics for Beginners', '2023-06-15', 111), 
(402, 202, 'Advanced Physics', '2023-06-20', 112), 
(403, 203, 'Introduction to Biology', '2023-06-25', 114);

# 1.Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

#2. List the employee names and their respective salaries in descending order of salary.

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

#3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

#4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT Emp_name, position
FROM Employee
WHERE Salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name
FROM Customer c
WHERE Reg_date < '2022-01-01'
AND NOT EXISTS (
    SELECT 1
    FROM IssueStatus i
    WHERE i.Issued_cust = c.Customer_Id
);

# 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

# 8. Display the names of customers who have issued books in the month of June 2023.

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

#9. Retrieve book titles from the book table containing "history".

SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

# 11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id
WHERE b.Rental_Price > 25;
