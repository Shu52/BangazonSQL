DELETE FROM Departments;
DELETE FROM Employees;
DELETE FROM DepartmentSupervisor;
DELETE FROM EmployeeTraining;
DELETE FROM TrainingPrograms;
DELETE FROM EmployeeTraining;
DELETE FROM Computers;
DELETE FROM Products;
DELETE FROM PaymentTypes;
DELETE FROM Orders;
DELETE FROM ProductOrders;

DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS DepartmentSupervisor;
DROP TABLE IF EXISTS EmployeeTraining;
DROP TABLE IF EXISTS TrainingPrograms;
DROP TABLE IF EXISTS EmployeeTraining;
DROP TABLE IF EXISTS Computers;
DROP TABLE IF EXISTS EmployeeComputer;
DROP TABLE IF EXISTS ProductTypes;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS PaymentTypes;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS ProductOrders;


CREATE TABLE 'Departments'(
	'DepartmentId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'DepartmentName' TEXT NOT NULL,
	'Budget' NUMERIC NOT NULL
	);
	
CREATE TABLE 'Employees'(
	'EmployeeId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'EmployeeName' TEXT NOT NULL,
	'Password' TEXT NOT NULL,
	'DepartmentId' INTEGER NOT NULL,
	FOREIGN KEY ('DepartmentId') REFERENCES 'Departments'(DepartmentId)
	);
	
CREATE TABLE 'DepartmentSupervisor'(
	'DepartmentSupervisorId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'SupervisorId' INTEGER,
	'DepartmentId' INTEGER,
	FOREIGN KEY ('SupervisorId') REFERENCES 'Employees'(EmployeeId),
	FOREIGN KEY ('DepartmentId') REFERENCES 'Departments'(DepartmentId)
	);
	
CREATE TABLE 'TrainingPrograms'(
	'TrainingProgramId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'TrainingProgramName' TEXT NOT NULL,
	'StartDate' TEXT,
	'StopDate' TEXT,
	'MaxAttendees' INTEGER
	);
	
CREATE TABLE 'EmployeeTraining'(
	'EmployeeTrainingId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'TrainingProgramId' INTEGER,
	'EmployeeId' INTEGER,
	FOREIGN KEY(`TrainingProgramId`) REFERENCES `TrainingPrograms`(`TrainingProgramId`),
	FOREIGN KEY(`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
	);
	
CREATE TABLE 'Computers'(
		'ComputerId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
		'PurchaseDate' TEXT NOT NULL,
		'DecommissionDate' TEXT,
		'Operational' BIT
		);
	
CREATE TABLE 'EmployeeComputer'(
	'EmployeeComputerId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'ComputerId' INTEGER NOT NULL,
	'EmployeeId' INTEGER NOT NULL,
	'AssignedDate' TEXT,
	FOREIGN KEY ('ComputerId') REFERENCES 'Computers'('ComputerId'),
	FOREIGN KEY ('EmployeeId') REFERENCES 'Employees'('EmployeeId')
	);
	
CREATE TABLE 'ProductTypes'(
	'ProductTypeId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'ProductCategory' TEXT NOT NULL
	);
		
CREATE TABLE 'Customers' (
	'CustomerId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'FirstName' TEXT NOT NULL,
	'LastName' TEXT NOT NULL,
	'LastActivity' TEXT
	);
	
CREATE TABLE 'Products'(
	'ProductId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'ProductTypeId' INTEGER NOT NULL,
	'CustomerId' INTEGER NOT NULL,
	'Price' NUMERIC,
	'Title' TEXT NOT NULL,
	'Descripton' TEXT NOT NULL,
	'Quanity' INTEGER NOT NULL,
	FOREIGN KEY ('ProductTypeId') REFERENCES 'ProductTypes'('ProductTypeId'),
	FOREIGN KEY ('CustomerId') REFERENCES 'Customers'('CustomerId')
	);
	
CREATE TABLE 'PaymentTypes'(
	'PaymentTypeId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'PaymentType' TEXT NOT NULL,
	'Account' INTEGER,
	'CustomerId' INTEGER NOT NULL,
	FOREIGN KEY ('CustomerId') REFERENCES 'Customers' ('CustomerId')
	);

CREATE TABLE 'Orders'(
	'OrderId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'CustomerId' INTEGER NOT NULL,
	'PaymentTypeId' INTEGER,
	FOREIGN KEY ('CustomerId') REFERENCES 'Customers' ('CustomerId'),
	FOREIGN KEY ('PaymentTypeId') REFERENCES 'PaymentTypes' ('PaymentTypeId')
	);
	
CREATE TABLE 'ProductOrders'(
	'ProductOrderId' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	'OrderId' INTEGER NOT NULL,
	'ProductId' INTEGER NOT NULL,
	FOREIGN KEY ('OrderId') REFERENCES 'Orders' ('OrderId'),
	FOREIGN KEY ('ProductId') REFERENCES 'Products' ('ProductId')
	);
	
INSERT INTO Departments VALUES(null,"Cafeteria", 1000000);
INSERT INTO Departments VALUES(null,"Administration", 20000.00);
INSERT INTO Departments VALUES(null,"Marketing", 35000.00);

INSERT INTO Employees VALUES(null,"Chef", "password", 1);
INSERT INTO Employees VALUES(null,"Jeremiah", "Password", 2);
INSERT INTO Employees VALUES(null,"Kristen", "p@ssword", 3);

INSERT INTO DepartmentSupervisor VALUES(null,1,1);
INSERT INTO DepartmentSupervisor VALUES(null,2,2);
INSERT INTO DepartmentSupervisor VALUES(null,3,3);

INSERT INTO TrainingPrograms VALUES(null,'Introduction', '05/21/2018',null,25);
INSERT INTO TrainingPrograms VALUES(null,'Which one is the Salad Fork?', '08/01/2018',null,20);
INSERT INTO TrainingPrograms VALUES(null,'Talking to Recruiters', '07/14/2018','07/15/2018',10);

INSERT INTO EmployeeTraining VALUES(null,1, 2);
INSERT INTO EmployeeTraining VALUES(null,1, 1);
INSERT INTO EmployeeTraining VALUES(null,1, 3);

INSERT INTO Computers VALUES(null,"01012018",null, 1);
INSERT INTO Computers VALUES(null,"01012018","09062018", 0);
INSERT INTO Computers VALUES(null,"01012018",null, 0);

INSERT INTO EmployeeComputer VALUES(null,1,1,"09062018");
INSERT INTO EmployeeComputer VALUES(null,2,2,"09062018");
INSERT INTO EmployeeComputer VALUES(null,3,3,"09062018");

INSERT INTO ProductTypes VALUES(null,"Meat");
INSERT INTO ProductTypes VALUES(null,"Produce");
INSERT INTO ProductTypes VALUES(null,"Drinks");

INSERT INTO Customers VALUES(null,"Fred","Strickland","09062018");
INSERT INTO Customers VALUES(null,"Michael","Moore","09062018");
INSERT INTO Customers VALUES(null,"Jennifer","Ellen","09062018");

INSERT INTO Products VALUES(null,1,1,19.95,"Steak", "Mouth Watering Steak!",1);
INSERT INTO Products VALUES(null,2,2,1.95,"Apples", "Red Apples",12);
INSERT INTO Products VALUES(null,3,3,29.95,"Whiskey", "Bootle of Jack Daniels",8);

INSERT INTO PaymentTypes VALUES(null,"Visa",1023920940298,1);
INSERT INTO PaymentTypes VALUES(null,"Cash",null,1);
INSERT INTO PaymentTypes VALUES(null,"PayPal",5550084676,2);

INSERT INTO Orders VALUES (null,1,2);
INSERT INTO Orders VALUES (null,1,1);
INSERT INTO Orders VALUES (null,2,3);

INSERT INTO ProductOrders VALUES (null,1,1);
INSERT INTO ProductOrders VALUES (null,2,2);
INSERT INTO ProductOrders VALUES (null,3,3);
