#!/bin/bash


import mysql.connector
from mysql.connector import Error

# Database connection details
    mydb = mysql.connector.connect(
        host="localhost",
        user="Tshedza",
        password="@My1livetshe"
    )

    mycursor = mydb.cursor()

# Create a database named `alx_book_store` 
    mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database alx book store created successfully!")

    mydb.database = "alx_book_store"

# Create the table named `Books` 
    mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE
    )""")
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
    address TEXT)
    """)
#create orders table
    mycursor.execute("""
    CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id))
    """)

#create order detail table
    mycursor.execute("""CREATE TABLE IF NOT EXISTS Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id))
    """)
    print("Tables created successfully")

except mysql.connector.Error as err:
     print(f"Error: {err}")

#finally:
    #if mydb.is_connected():
mycursor.close()
mydb.close()
        #print("MySQL connection is closed.")



