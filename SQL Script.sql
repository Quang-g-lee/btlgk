-- Create tables
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    ProductDescription VARCHAR(200) NOT NULL,
    ProductPrice DECIMAL(10, 2) NOT NULL,
    ProductImage VARCHAR(100) NOT NULL,
    ProductCategory VARCHAR(50) NOT NULL,
    Supplier VARCHAR(50) NOT NULL
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50) NOT NULL,
    CustomerAddress VARCHAR(100) NOT NULL,
    CustomerPhone VARCHAR(20) NOT NULL,
    CustomerEmail VARCHAR(50) NOT NULL,
    CustomerPassword VARCHAR(50) NOT NULL
);

CREATE TABLE Channels (
    ChannelID INT PRIMARY KEY AUTO_INCREMENT,
    ChannelName VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    OrderTotal DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE ProductChannels (
    ProductID INT NOT NULL,
    ChannelID INT NOT NULL,
    ProductPriceOnChannel DECIMAL(10, 2) NOT NULL,
    ProductQuantityOnChannel INT NOT NULL,
    PRIMARY KEY (ProductID, ChannelID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountName VARCHAR(50) NOT NULL,
    AccountPassword VARCHAR(50) NOT NULL,
    ChannelID INT NOT NULL,
    FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID)
);

CREATE TABLE Reports (
    ReportID INT PRIMARY KEY AUTO_INCREMENT,
    ReportType VARCHAR(50) NOT NULL,
    ReportDate DATETIME NOT NULL,
    ReportContent VARCHAR(200) NOT NULL
);