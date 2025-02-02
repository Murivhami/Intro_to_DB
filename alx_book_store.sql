#!/bin/bash
import mysql.connector

# Database connection details (replace with your own)
mydb = mysql.connector.connect(
    host="localhost",
    user="Tshedza",
    password="@My1livetshe"
)

mycursor = mydb.cursor()

# Create a database named `alx_book_store` (if it doesn't exist)
mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

# Switch to the `alx_book_store` database
mydb.database = "alx_book_store"

# Create the table named `Books` (if it doesn't exist)
mycursor.execute("""
CREATE TABLE IF NOT EXISTS Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130),
  author_id INT,
  price DOUBLE,
  publication_date DATE
)
""")
#create authors table
mycursor.execute("""
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT AUTO_INCREMENT PRIMARY KEY,
  author_name VARCHAR(130)
)
""")

#create customers table
mycursor.execute("""
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(215),
                 email VARCHAR(215),
                 address TEXT
                 
)
""")
#create orders table
mycursor.execute("""
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
                 order_date DATE,
                 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)
""")

#create order detail table
mycursor.execute("""
CREATE TABLE IF NOT EXISTS Order_Details (
  order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
                 quantity DOUBLE,
                 FOREIGN KEY (order_id) REFERENCES Orders(customer_id),
                 FOREIGN KEY (book_id) REFERENCES Books(book_id)
)
""")


print("Tables created successfully")

# Close the connection
mycursor.close()
mydb.close()

