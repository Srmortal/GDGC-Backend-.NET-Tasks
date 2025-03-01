CREATE DATABASE social;
USE social;
CREATE TABLE Customer(
    ID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Email VARCHAR(100),
    PhoneNumber NVARCHAR(12),
    Address NVARCHAR(230)
);
CREATE TABLE Order(
    OrderID INT IDENTITY PRIMARY KEY,
    OrderDate DATE,
    totalAmount DECIMAL(9,4),
    Status VARCHAR(30),
    CustomerID INT FOREIGN KEY REFERENCES Customer(ID) NOT NULL
);
CREATE TABLE OrderDetails(
    OrderDetailID INT IDENTITY PRIMARY KEY,
    Quantity INT,
    Price DECIMAL(10,3),
    OrderID INT FOREIGN KEY REFERENCES Order(OrderID) NOT NULL UNIQUE
);
CREATE TABLE Product(
    ProductID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100),
    Description NVARCHAR(300),
    Price DECIMAL(10,3),
    Category NVARCHAR(70),
    OrderDetailID INT FOREIGN KEY REFERENCES OrderDetails(OrderDetailID) NOT NULL
);
CREATE TABLE Supplier(
    ID INT IDENTITY PRIMARY KEY,
    ContactInfo NVARCHAR(200),
    Name NVARCHAR(100)
);
CREATE TABLE Supply(
    ProductID INT FOREIGN KEY REFERENCES Product(ProductID) NOT NULL,
    SupplierID INT FOREIGN KEY REFERENCES Supplier(ID) NOT NULL
);
CREATE TABLE Product_Orders(
    ProductID INT FOREIGN KEY REFERENCES Product(ProductID) NOT NULL,
    OrderID INT FOREIGN KEY REFERENCES Order(OrderID) NOT NULL
);
-- Inserting into the Customer table
INSERT INTO Customer (Name, Email, PhoneNumber, Address)
VALUES 
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, City, Country'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak St, City, Country');

-- Inserting into the Order table
INSERT INTO [Order] (OrderDate, totalAmount, Status, CustomerID)
VALUES 
('2025-03-01', 100.50, 'Pending', 1),
('2025-03-02', 200.75, 'Completed', 2);

-- Inserting into the OrderDetails table
INSERT INTO OrderDetails (Quantity, Price, OrderID)
VALUES 
(2, 50.25, 1),
(3, 66.92, 2);

-- Inserting into the Product table
INSERT INTO Product (Name, Description, Price, Category, OrderDetailID)
VALUES 
('Product A', 'Description of Product A', 25.50, 'Category 1', 1),
('Product B', 'Description of Product B', 33.80, 'Category 2', 2);

-- Inserting into the Supplier table
INSERT INTO Supplier (ContactInfo, Name)
VALUES 
('contact1@supplier.com, 123-789-4560', 'Supplier One'),
('contact2@supplier.com, 987-321-6540', 'Supplier Two');

-- Inserting into the Supply table
INSERT INTO Supply (ProductID, SupplierID)
VALUES 
(1, 1),
(2, 2);

-- Inserting into the Product_Orders table
INSERT INTO Product_Orders (ProductID, OrderID)
VALUES 
(1, 1),
(2, 2);
ALTER TABLE Product
ADD Rating INT DEFAULT 0;
ALTER TABLE Product
ADD CONSTRAINT Category_Default DEFAULT 0 FOR Category;
ALTER TABLE Product
DROP COLUMN Rating;
ALTER TABLE [Order] DROP CONSTRAINT FK_Order_Customer;
DROP TABLE Customer;
ALTER TABLE Order
ADD CONSTRAINT Date_Default DEFAULT GETUTCDATE() FOR OrderDate;
DELETE Product WHERE Name IS NOT NULL;
DROP DATABASE social;