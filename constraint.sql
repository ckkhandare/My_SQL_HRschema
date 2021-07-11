-- CREATE TABLE with NULL CONSTRAINT
-- CREATE TABLE to check values with CHECK CONSTRAINT
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);
-- CREATE TABLE with CHECK CONSTRAINT using IN operator
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age IN (20,24,25))
);
-- CREATE TABLE with CHECK CONSTRAINT and LIKE operator
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    CHECK (FirstName LIKE '%L%')
);
-- CREATE TABLE with AND and OR operator and CHECK CONSTRAINT
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    CHECK (FirstName LIKE '%L%' AND LastName LIKE '%t' OR LastName LIKE '%i')
);
-- UNIQUE CONSTRAINT
-- UNIQUE CONSTRAINT check unique value
CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    FirstName varchar(255)
);
-- CREATE TABLE with DEFAULT CONSTRAINT
-- CREATE TABLE with AUTO INCREMENT
-- PRIMARY KEY CONSTRAINT
-- CREATE TABLE PRIMARY KEY CONSTRAINT on single column
CREATE TABLE Persons (
    ID int PRIMARY KEY AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    City varchar(255) DEFAULT 'Sandnes'
);
-- CREATE TABLE PRIMARY KEY UNIQUE CONSTRAINT
-- CREATE TABLE PRIMARY KEY on multiple columns
CREATE TABLE Persons (
    ID int UNIQUE ,
    LastName varchar(255) NOT NULL,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
-- creating table with FOREIGN KEY CONSTRAINT
-- CREATE TABLE with FOREIGN KEY CONSTRAINT on multiple columns
CREATE TABLE Orders (
    OrderID int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

-- CREATE TABLE with CASCADE
CREATE TABLE Orders (
    OrderID int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID) ON DELETE CASCADE
);
-- CREATE TABLE with SET NULL
CREATE TABLE Orders (
    OrderID int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID) ON DELETE SET NULL
);
-- CREATE TABLE with NO ACTION
CREATE TABLE Orders (
    OrderID int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);