# Online Store Database

This repository contains SQL scripts for creating a relational database schema for an online store. The database schema is designed to manage various aspects of an online store, including employees, customers, orders, products, payments, reviews, and more.

## Database Schema

The database schema consists of the following tables:

- `Employees`: Stores information about store employees, including their ID, name, social security number (SSN), designation, type, salary, and payment ID.
- `Person`: Contains personal information about individuals, such as their first name, last name, email address, phone number, SSN, and date of birth.
- `Orders`: Stores details about orders placed by customers, including the order ID, order date, status, shipment duration, and payment ID.
- `Customer`: Contains information about customers, including their ID, first name, last name, phone number, email address, and customer type.
- `Zip_Code`: Stores ZIP code information, including the state, ZIP code ID, city, and address ID.
- `Reviews`: Contains reviews submitted by customers, including quality rating, defect percentage, review ID, and review date.
- `Product`: Stores information about products available in the store, such as the product ID, product name, available quantity, group ID, supplier ID, and review ID.
- `Supplier`: Contains information about product suppliers, including their ID, name, and supply quantity.
- `Payment`: Stores payment details for orders, including payment ID, payment mode, card type, card number, CVV, name on card, customer ID, and visit number.
- `Bill`: Contains billing information for orders, including billing ID, billing date, amount paid, voucher ID, payment ID, order ID, and payment type.
- `Voucher`: Stores information about vouchers, including voucher ID, voucher name, discount amount, and expiration date.
- `Address`: Contains address details, including address ID, street address, city, state, postal code, and country.
- `ProductGroup`: Stores information about product groups, including group ID and group name.
- `OrderProduct`: Represents the relationship between orders and products, including order ID, product ID, quantity, and price per unit.
- `Productdetails`: Contains additional details about products, including product ID, product type, name, description, price, and category.

## Setup

To set up the database, follow these steps:

1. Ensure you have a compatible database management system (e.g., MySQL, PostgreSQL) installed on your machine.
2. Create a new database named `store`.
3. Run the provided SQL scripts to create the tables and define their relationships.
4. Optionally, populate the tables with sample data using additional SQL scripts.
5. Configure your application to connect to the database using the appropriate connection parameters.

