#!/bin/bash

import mysql.connector
from mysql.connector import Error

# Database connection details (replace with your own)
try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="Tshedza",
        password="@My1livetshe"
    )
    
    mycursor = mydb.cursor()

# Create a database named `alx_book_store` (if it doesn't exist)
    mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database alx book store created successfully!")

except Error as e:
    print("Error connection:", e)

finally:
    if mydb.is_connected():
        mycursor.close()
        mydb.close()
        print("MySQL connection is closed.")
