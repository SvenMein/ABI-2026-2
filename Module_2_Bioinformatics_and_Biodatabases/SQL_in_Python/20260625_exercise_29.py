# Selections in Python

import mysql.connector

# Setup connection to MySQL-server
connection = mysql.connector.connect(host="localhost", user="root", password="d1s80")

# Check server version
db_Info = connection.server_info
print("Connected to MySQL Server version", db_Info)

# Create cursor and select database
cursor = connection.cursor()
cursor.execute("DROP DATABASE IF EXISTS library")
cursor.execute("CREATE DATABASE library")
cursor.execute("USE library")

# Create tables
cursor.execute("""CREATE TABLE publishers (
               Publisher_ID INT AUTO_INCREMENT PRIMARY KEY,
               Publisher_Name VARCHAR(255),
               City VARCHAR(255),
               Address VARCHAR(255),
               EMail VARCHAR(255),
               Telephone VARCHAR(255),
               CONSTRAINT Mail_CHECK CHECK (EMail LIKE '%_@_%')
               )""")

cursor.execute("""CREATE TABLE books (
               Book_ID INT AUTO_INCREMENT PRIMARY KEY,
               Book_Title VARCHAR(255) NOT NULL,
               ISBN VARCHAR(255) NOT NULL,
               Publication_Date DATE,
               Publisher_ID INT,
               Page_Count INT,
               Price FLOAT,
               Original_Language VARCHAR(255),
               FOREIGN KEY (Publisher_ID) REFERENCES publishers(Publisher_ID)
               )""")

cursor.execute("""CREATE TABLE authors (
               Author_ID INT AUTO_INCREMENT PRIMARY KEY,
               Last_Name VARCHAR(255),
               Given_Name VARCHAR(255),
               Title VARCHAR(255),
               Birthdate DATE,
               Birthplace VARCHAR(255),
               UNIQUE (Last_Name, Given_Name, Title)
               )""")

cursor.execute("""CREATE TABLE wrote (
               Book_ID INT,
               Author_ID INT,
               PRIMARY KEY (Book_ID, Author_ID),
               FOREIGN KEY (Book_ID) REFERENCES books(Book_ID),
               FOREIGN KEY (Author_ID) REFERENCES authors(Author_ID)
               )""")

print("Tables have been created")

# Close cursor and connection
cursor.close()
connection.close()