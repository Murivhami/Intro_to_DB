#!/bin/bash

import mysql.connector

# Database connection details (replace with your own)
mydb = mysql.connector.connect(
    host="localhost",
    user="Tshedza",
    password="@My1livetshe",
    database="alx_book_store"
)

mycursor = mydb.cursor()

# Create a table named `customers` (if it doesn't exist)
mycursor.execute("""
CREATE TABLE IF NOT EXISTS Books (
  book_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(130),
    author_id INT,
    price DOUBLE,
    publication_date DATE
)
""")

print("Books table created successfully")
