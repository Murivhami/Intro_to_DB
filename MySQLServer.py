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

print("Database alx book store created successfully!")

#Close
mycursor.close()
mydb.close()
