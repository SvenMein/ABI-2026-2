# Filling in tables in Python
import mysql.connector

# Data entry function
def insert_into_table_publishers(arg1, arg2, arg3, arg4, arg5, arg6):
    query = "INSERT INTO publishers (Publisher_ID, Publisher_Name, City, Address, EMail, Telephone) VALUES (%s, %s, %s, %s, %s, %s)"
    record = (arg1, arg2, arg3, arg4, arg5, arg6)
    cursor.execute(query, record)
    connection.commit()
    print(F"The values {arg1}, {arg2}, {arg3}, {arg4}, {arg5}, {arg6} have been added into table publishers")

def insert_into_table_books(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8):
    query = "INSERT INTO books (Book_ID, Book_Title, ISBN, Publication_Date, Publisher_ID, Page_Count, Price, Original_Language) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    record = (arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    cursor.execute(query, record)
    connection.commit()
    print(F"The values {arg1}, {arg2}, {arg3}, {arg4}, {arg5}, {arg6}, {arg7}, {arg8} have been added into table books")

def insert_into_table_authors(arg1, arg2, arg3, arg4, arg5, arg6):
    query = "INSERT INTO authors (Author_ID, Last_Name, Given_Name, Title, Birthdate, Birthplace) VALUES (%s, %s, %s, %s, %s, %s)"
    record = (arg1, arg2, arg3, arg4, arg5, arg6)
    cursor.execute(query, record)
    connection.commit()
    print(F"The values {arg1}, {arg2}, {arg3}, {arg4}, {arg5}, {arg6} have been added into table authors")

def insert_into_table_wrote(arg1, arg2):
    query = "INSERT INTO wrote (Book_ID, Author_ID) VALUES (%s, %s)"
    record = (arg1, arg2)
    cursor.execute(query, record)
    connection.commit()
    print(F"The values {arg1}, {arg2} have been added into table wrote")

# Setup connection to MySQL-server
connection = mysql.connector.connect(host="localhost", user="root", password="d1s80")

# Check server version
db_Info = connection.server_info
print("Connected to MySQL Server version", db_Info)

# Create cursor and select database
cursor = connection.cursor()
cursor.execute("USE library")

# Creating lists with data to entry
publishers_ID = [0, 0, 0, 0]
publishers_name = ['Nature', 'Cell', 'eLIFE', 'Science']
publishers_city = ['New York', 'London', 'Berlin', 'Tokyo']
publisher_address = ['123 Road', '96845 Street', '8132 Ave', '02 Way']
publishers_email = ['asd@asd', 'qwe@asd', 'qwe@a', 'asdasdada@as']
publisher_telephone = ['+46010325416', '+01564612', '+13545845', '+54651354']

books_ID = [0, 0]
books_title = ['The Count of Monte Christo', 'Gone with the WNT']
book_isbn = ['025168', '025654']
books_date = ['1846-01-15', '1998-05-12']
books_pubid = [2, 3]
book_pagecount = [2000, 3]
book_price = [25.00, 3.99]
book_language = ['French', 'English']

author_ID = [0, 0, 0]
author_lastname = ['Dumas', 'Stevens', 'King']
author_givenname = ['Alexander', 'Thomas', 'Steven']
author_title = ['The older', 'Prof. Dr.', None]
authors_birthdate = ['1802-07-24', '1944-05-13', '1950-06-23']
authors_birthplace = ['Villers-Cotterets', 'New York', 'Tokyo']

wrote_bookid = [1, 2]
wrote_authorid = [1, 3]

# Entering the data
for pubid, pubname, pubcity, pubaddress, pubemail, pubtelephone in zip(publishers_ID, publishers_name, publishers_city, publisher_address, publishers_email, publisher_telephone):
    insert_into_table_publishers(pubid, pubname, pubcity, pubaddress, pubemail, pubtelephone)
print("##########")
print()

for bookid, booktitle, bookisbn, bookdate, bookpubid, bookpage, bookprice, booklang in zip(books_ID, books_title, book_isbn ,books_date, books_pubid, book_pagecount, book_price, book_language):
    insert_into_table_books(bookid, booktitle, bookisbn, bookdate, bookpubid, bookpage, bookprice, booklang)
print("##########")
print()

for authid, authlname, authgname, authtitle, authbirthdate, authbirthplace in zip(author_ID, author_lastname, author_givenname, author_title, authors_birthdate, authors_birthplace):
    insert_into_table_authors(authid, authlname, authgname, authtitle, authbirthdate, authbirthplace)
print("##########")
print()

for wrotebid, wroteaid in zip(wrote_bookid, wrote_authorid):
    insert_into_table_wrote(wrotebid, wroteaid)
print("##########")
print()

# Close cursor and connection
cursor.close()
connection.close()
print("The database hase been changed")