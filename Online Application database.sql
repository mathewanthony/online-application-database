-- Create a database
CREATE DATABASE IF NOT EXISTS store ;

-- Use the newly created database as the default schema
USE store;

-- Create the table
-- ssn refers to social security number in below query

-- Create the table Employees
-- Table Employees
CREATE TABLE Employees (
    employee_id CHAR(3) NOT NULL,
    employee_name VARCHAR(20) NOT NULL,
    ssn VARCHAR(9) NOT NULL, -- Adjusted data type
    designation VARCHAR(10) NOT NULL,
    employee_type VARCHAR(20) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL, -- Adjusted data type
    payment_id CHAR(3) NOT NULL,
    PRIMARY KEY (employee_id),
    INDEX IX_Relationship8 (payment_id) -- Creating an index
);

-- Create an index on the 'ssn' column
CREATE INDEX IX_Relationship30 ON Employee (ssn);


-- Table Person

CREATE TABLE Person (
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Email_Address VARCHAR(255),
    Phone_Number VARCHAR(15),
    ssn INT NOT NULL,
    Date_Of_Birth DATE
);

ALTER TABLE `Person` ADD  PRIMARY KEY (`ssn`)
;

-- Table Orders

CREATE TABLE Orders (
    order_id VARCHAR(10) NOT NULL, -- Adjusted data type and length
    order_date DATE NOT NULL,
    status VARCHAR(20),
    shipment_duration VARCHAR(20) NOT NULL,
    payment_id INT NOT NULL -- Adjusted data type
);

ALTER TABLE `Orders` ADD  PRIMARY KEY (`Order_ID`)
;

-- Table Customer

CREATE TABLE Customer (
    customer_id VARCHAR(10) NOT NULL, -- Adjusted data type and length
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_number INT NOT NULL,
    email_address VARCHAR(255) NOT NULL, -- Adjusted length
    customer_type VARCHAR(20) NOT NULL
);


ALTER TABLE `Customer` ADD  PRIMARY KEY (`Customer_ID`)
;

-- Table Zip_Code
CREATE TABLE Zip_Code (
    State VARCHAR(20) NOT NULL,
    Zipcode_ID CHAR(5) NOT NULL,
    City VARCHAR(20) NOT NULL,
    Address_ID CHAR(2) NOT NULL
);

-- Table Reviews
CREATE TABLE Reviews (
    quality_rating TINYINT NOT NULL,
    defect_percent DECIMAL(5, 2) NOT NULL,
    review_id VARCHAR(4) NOT NULL,
    review_date DATE,
    PRIMARY KEY (review_id)
);

-- Table Product
CREATE TABLE Product (
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    available_quantity INT, -- Assuming it represents quantity
    group_id INT NOT NULL,
    supplier_id CHAR(4) NOT NULL,
    review_id VARCHAR(4),
    PRIMARY KEY (product_id)
);

CREATE INDEX IX_Relationship1 ON Product (Group_ID);
CREATE INDEX IX_Relationship2 ON Product (Supplier_ID);
CREATE INDEX IX_Relationship3 ON Product (Review_ID);

-- Table Supplier

CREATE TABLE `Supplier`
(
  `Supplier_ID` Char(4) NOT NULL,
  `Supplier_Name` Varchar(20) NOT NULL,
  `Supply_Quantity` Varchar(2000) NOT NULL
)
;

ALTER TABLE `Supplier` ADD  PRIMARY KEY (`Supplier_ID`)
;

-- Table Payment
CREATE TABLE Payment (
    payment_id CHAR(3) NOT NULL,
    payment_mode VARCHAR(20) NOT NULL,
    card_type VARCHAR(20) NOT NULL,
    card_number VARCHAR(16) NOT NULL, -- Adjusted data type and length
    cvv VARCHAR(4) NOT NULL, -- Adjusted data type and length
    name_on_card VARCHAR(50) NOT NULL, -- Adjusted length
    customer_id CHAR(5) NOT NULL,
    visit_number INT NOT NULL,
    PRIMARY KEY (payment_id),
    INDEX IX_Relationship11 (customer_id) -- Creating an index
);

-- Table Bill
CREATE TABLE Bill (
    billing_id CHAR(5) NOT NULL,
    billing_date DATE NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    voucher_id VARCHAR(2),
    payment_id CHAR(3) NOT NULL,
    order_id CHAR(4) NOT NULL,
    payment_type VARCHAR(20), -- Added column for payment type
    PRIMARY KEY (billing_id),
    INDEX IX_Relationship4 (voucher_id),
    INDEX IX_Relationship9 (payment_id),
    INDEX IX_Relationship16 (order_id)
);

-- Table Voucher
CREATE TABLE Voucher (
    voucher_id VARCHAR(2) NOT NULL,
    voucher_name VARCHAR(50) NOT NULL,
    discount_amount DECIMAL(10, 2) NOT NULL,
    expiration_date DATE NOT NULL,
    PRIMARY KEY (voucher_id)
);


-- Table Address
CREATE TABLE Address (
    address_id INT NOT NULL,
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL,
    PRIMARY KEY (address_id)
);


-- Table ProductGroup
CREATE TABLE ProductGroup (
    group_id INT NOT NULL,
    group_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (group_id)
);

-- Table OrderProduct
CREATE TABLE OrderProduct (
    order_id CHAR(4) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price_per_unit DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), -- Assuming you have an "Orders" table
    FOREIGN KEY (product_id) REFERENCES Product(product_id) -- Assuming you have a "Product" table
);

-- Table Productdetails
CREATE TABLE Productdetails (
    product_id INT NOT NULL,
    product_type VARCHAR(20) NOT NULL, -- 'Product' or 'Customer'
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2),
    category VARCHAR(50), -- Only for products
    PRIMARY KEY (product_id)
);

CREATE TABLE `Zip Code` (
    State VARCHAR(20) NOT NULL,
    Zipcode_ID CHAR(5) NOT NULL,
    City VARCHAR(20) NOT NULL,
    Address_ID CHAR(2) NOT NULL,
    PRIMARY KEY (Zipcode_ID)
);



-- Product Table Relationships

ALTER TABLE `Product` ADD CONSTRAINT `belongs_to` FOREIGN KEY (`Group_ID`) REFERENCES `ProductGroup` (`Group_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Product` ADD CONSTRAINT `supplies` FOREIGN KEY (`Supplier_ID`) REFERENCES `Supplier` (`Supplier_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `Product` ADD CONSTRAINT `are_given` FOREIGN KEY (`Review_ID`) REFERENCES `Reviews` (`Review_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Bill Table Relationships
ALTER TABLE `Bill` ADD CONSTRAINT `is_included` FOREIGN KEY (`Voucher_ID`) REFERENCES `Voucher` (`Voucher_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Address Table Relationships
ALTER TABLE `Address` ADD COLUMN `customer_id` INT;

-- Employees Table Relationships
ALTER TABLE `Employees` ADD CONSTRAINT `monitors` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`Payment_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Bill Table Relationships (Additional)
ALTER TABLE `Bill` ADD CONSTRAINT `Generates` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`Payment_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Payment Table Relationships
ALTER TABLE `Payment` ADD CONSTRAINT `makes` FOREIGN KEY (`Customer_ID`) REFERENCES `Customer` (`Customer_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Bill Table Relationships (Additional)
ALTER TABLE `Bill` ADD CONSTRAINT `is_billed` FOREIGN KEY (`Order_ID`) REFERENCES `Orders` (`Order_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Product Details Table Relationships
ALTER TABLE `ProductDetails` ADD CONSTRAINT `has_details` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;