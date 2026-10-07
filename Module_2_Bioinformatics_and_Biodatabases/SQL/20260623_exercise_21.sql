-- Your first tables
CREATE TABLE books (
ID INT,
Book_Title VARCHAR(255),
Publication_Date DATE,
Publisher_ID INT,
Page_Count INT,
Translator_ID INT,
Original_Language VARCHAR(255)
);

CREATE TABLE publishers (
ID INT,
Publisher_Name VARCHAR(255),
City VARCHAR(255),
Address VARCHAR(255),
Email VARCHAR(255),
Telephone VARCHAR(255)
);

CREATE TABLE authors (
ID INT,
Last_Name VARCHAR(255),
Given_Name VARCHAR(255),
Title VARCHAR(255),
Birthdate DATE,
Birthplace VARCHAR(255)
);

CREATE TABLE wrote (
Book_ID INT,
Author_ID INT
);

CREATE TABLE courses (
Course_ID INT,
Course_Name VARCHAR(255),
Course_Length FLOAT,
Room VARCHAR(255)
);

CREATE TABLE teachers (
Teacher_ID INT,
Last_Name VARCHAR(255),
Given_Name VARCHAR(255),
Room VARCHAR(255),
Email VARCHAR(255),
Telephone VARCHAR(255)
);

CREATE TABLE students (
Student_ID INT,
Last_Name VARCHAR(255),
Given_Name VARCHAR(255),
Email VARCHAR(255)
);

CREATE TABLE teaches (
Course_ID INT,
Teacher_ID INT,
Weekday VARCHAR(255),
Hours FLOAT
);

CREATE TABLE visits (
Course_ID INT,
Student_ID INT,
Weekday VARCHAR(255),
Hours FLOAT
);