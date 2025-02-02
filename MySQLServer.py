#!/bin/bash

import mysql.connector
from mysql.connector import Error

# Database connection details
try:
    mydb = mysql.connector.connect(
        host="localhost",
        user="Tshedza",
        password="@My1livetshe"
    )
    
    mycursor = mydb.cursor()

# Create a database named `alx_book_store`
    mycursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database alx book store created successfully!")

except mysql.connector.Error as err:
     print(f"Error: {err}")

finally:
    if mydb.is_connected():
        mycursor.close()
        mydb.close()
        print("MySQL connection is closed.")
