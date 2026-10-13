-- SQLite schema and demonstration records transcribed from the supplied project report.

CREATE TABLE Rest_branch (
  Number INT PRIMARY KEY,
  email VARCHAR(50) NOT NULL,
  phone VARCHAR(15),
  city VARCHAR(30),
  street VARCHAR(30),
  zip_code VARCHAR(10)
);

INSERT INTO Rest_branch VALUES
(1, 'branch1@restaurant.com', '0551234567', 'Riyadh', 'King Fahd Rd', '12211'),
(2, 'branch2@restaurant.com', '0557654321', 'Jeddah', 'Tahlia St', '23322'),
(3, 'branch3@restaurant.com', '0569876543', 'Dammam', 'Corniche Rd', '34411');

CREATE TABLE Dish (
   Name VARCHAR(100) PRIMARY KEY,
   price DECIMAL(6,2) CHECK (price > 0),
   recipe VARCHAR(300) NOT NULL,
   food_allergy VARCHAR(200),
   serving_time VARCHAR(10) NOT NULL CHECK (serving_time IN ('Breakfast',
'Lunch', 'Dinner'))
);

INSERT INTO Dish (Name, price, recipe, food_allergy, serving_time)
VALUES
('Spaghetti', 35.00, 'Pasta with tomato sauce and beef', 'Gluten', 'Lunch'),
('Caesar Salad', 25.50, 'Salad with lettuce, croutons, and parmesan', 'Dairy',
'Breakfast'),
('Mango Smoothie', 18.75, 'Blended mango with yogurt and honey', 'Dairy', 'Dinner');

DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
   ID INT PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   middle_name VARCHAR(50),
   last_name VARCHAR(50) NOT NULL,
   address VARCHAR(200),
   phone VARCHAR(20),
   email VARCHAR(100) NOT NULL
);

INSERT INTO Person (ID, first_name, middle_name, last_name, address, phone,
email)
VALUES


                                                                                  



(1, 'Ali', 'Saad', 'AlShehri', 'Riyadh, King Road', '0501122334', 'ali@email.com'),
(2, 'Sara', 'Nasser', 'AlQahtani', 'Jeddah, Main St', '0502233445', 'sara@email.com'),
(3, 'Mona', 'Khaled', 'AlZahrani', 'Dammam, Corniche', '0503344556',
'mona@email.com'),
(4, 'Mohammed', 'Nasser', 'AlShehri', 'Jeddah, Main St', '0502233999',
'Mohammed@email.com'),
(5, 'Khaled', 'Khaled', 'AlShehri', 'Dammam, Corniche', '0503344888',
'Khaled@email.com'),
(6, 'Turki', 'Nasser', 'AlShehri', 'Jeddah, Main St', '0502233406', 'Turki@email.com'),
(7, 'Lujain', 'Khaled', 'AlShehri', 'Dammam, Corniche', '0503344508',
'Lujain@email.com'),
(8, 'Fisal', 'Nasser', 'AlZahrani', 'Jeddah, Main St', '0502233907', 'Fisal@email.com'),
(9, 'Jana', 'Abdullah', 'AlShehri', 'Jeddah, Main St', '0502233111', 'Jana@email.com'),
(10, 'Fahad', 'Khaled', 'AlQahtani', 'Dammam, Corniche', '0503344809',
'Fahad@email.com');

CREATE TABLE chef (
   personID INT PRIMARY KEY,
   salary DECIMAL(8,2) CHECK (salary > 0),
   type VARCHAR(50) NOT NULL,
   BranchNumber INT NOT NULL,
   chef_tutorID INT,
   FOREIGN KEY (personID) REFERENCES Person(ID),
   FOREIGN KEY (BranchNumber) REFERENCES Rest_branch(Number),
   FOREIGN KEY (chef_tutorID) REFERENCES chef(personID)
);

INSERT INTO chef (personID, salary, type, BranchNumber, chef_tutorID)
VALUES
(1, 8000.00, 'Head Chef', 1, NULL),
(2, 5000.00, 'Assistant', 2, 1),
(3, 6000.00, 'Sous Chef', 3, 1);

CREATE TABLE employee (
   personID INT PRIMARY KEY,
   salary DECIMAL(8,2) CHECK (salary > 0),
   position VARCHAR(50) NOT NULL,
   FOREIGN KEY (personID) REFERENCES Person(ID)
);

INSERT INTO employee (personID, salary, position)
VALUES
(4, 4500.00, 'Cashier'),
(5, 6000.00, 'Supervisor'),
(6, 5500.00, 'Cleaner');

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
   Num INT PRIMARY KEY,
   date DATE NOT NULL,
   time TIME NOT NULL,
   comments VARCHAR(300),
   person_ID INT NOT NULL,
   FOREIGN KEY (person_ID) REFERENCES Person(ID)
);

INSERT INTO Orders (Num, date, time, comments, person_ID)
VALUES
(101, '2025-05-17', '12:15:00', 'No onions please',7),
(102, '2025-05-17', '13:45:00', 'Extra cheese', 8),
(103, '2025-05-17', '14:30:00', 'Add ketchup', 9)
;

CREATE TABLE customer (
   personID INT PRIMARY KEY,
   password VARCHAR(100) NOT NULL,
   FOREIGN KEY (personID) REFERENCES Person(ID)
);

INSERT INTO customer (personID, password)
VALUES
(7, 'cust@1234'),
(8, 'mypassword88'),
(9, 'aapassword88'),
(10, 'securePass#9');

CREATE TABLE provide (
   branchNum INT,
   dishName VARCHAR(100),
   PRIMARY KEY (branchNum, dishName),
   FOREIGN KEY (branchNum) REFERENCES Rest_branch(Number),
   FOREIGN KEY (dishName) REFERENCES Dish(Name)
);

INSERT INTO provide (branchNum,dishName)
VALUES


                                                             



(1, 'Spaghetti'),
(1, 'Caesar Salad'),
(1, 'Mango Smoothie'),
(2, 'Spaghetti'),
(2, 'Caesar Salad'),
(2, 'Mango Smoothie'),
(3, 'Spaghetti'),
(3, 'Caesar Salad'),
(3, 'Mango Smoothie');

CREATE TABLE cook (
   chefID INT,
   dishName VARCHAR(100),
   PRIMARY KEY (chefID, dishName),
   FOREIGN KEY (chefID) REFERENCES Person(ID),
   FOREIGN KEY (dishName) REFERENCES Dish(Name)
);

INSERT INTO cook (chefID, dishName)
VALUES
(1, 'Spaghetti'),
(2, 'Caesar Salad'),
(3, 'Mango Smoothie');

CREATE TABLE hasOrderCook (
   orderNum INT,
   dishName VARCHAR(100),
   PRIMARY KEY (orderNum, dishName),
  FOREIGN KEY (orderNum) REFERENCES Orders(Num),
   FOREIGN KEY (dishName) REFERENCES Dish(Name)
);

INSERT INTO hasOrderCook (orderNum, dishName)
VALUES
(101, 'Spaghetti'),
(102, 'Caesar Salad'),
(103, 'Mango Smoothie'),
(103, 'Spaghetti')
;
