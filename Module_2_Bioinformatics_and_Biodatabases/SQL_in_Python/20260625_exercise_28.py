# Selections in Python

import mysql.connector

# Setup connection to MySQL-server
connection = mysql.connector.connect(host="localhost", user="root", password="d1s80")

# Check server version
db_Info = connection.server_info
print("Connected to MySQL Server version", db_Info)

# Create cursor and select database
cursor = connection.cursor()
cursor.execute("USE databasecq")

# Running SELECT statements
cursor.execute("SELECT COUNT(Domain_ID), Domain_ID FROM domains_proteins " \
"GROUP BY Domain_ID HAVING COUNT(Protein_ID) >= 10")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT organisms.Taxonomy, kingdoms.Kingdom_Name " \
"FROM organisms INNER JOIN kingdoms " \
"ON organisms.Kingdom_ID=kingdoms.Kingdom_ID " \
"WHERE kingdoms.Kingdom_ID IN (1,2,3)")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT AVG(Protein_Length) FROM proteins WHERE Mass < 15000")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT * FROM structures " \
"WHERE Source_ID = 2 " \
"ORDER BY Identifier LIMIT 20")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT Protein_Name FROM proteins " \
"WHERE Protein_ID IN "
"(SELECT Protein_ID FROM modifications_proteins " \
"WHERE Modification_ID IN "
"(SELECT Modification_ID FROM modification_data " \
"WHERE Melting_Point IS NOT NULL))")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT * FROM structural_data " \
"WHERE Released BETWEEN '1995-01-01' AND '1998-12-31'")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT Mass FROM atom_information " \
"UNION SELECT Molecular_Weight FROM modification_data")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT COUNT(Protein_ID), Sec_Structure_ID " \
"FROM secondary_protein GROUP BY Sec_Structure_ID")
records = cursor.fetchall()
print(records)
print()

cursor.execute("SELECT organisms.Taxonomy, kingdoms.Kingdom_Name " \
"FROM organisms INNER JOIN kingdoms " \
"ON organisms.Kingdom_ID=kingdoms.Kingdom_ID " \
"WHERE kingdoms.Kingdom_ID IN (1,2,3)")
records = cursor.fetchall()
print(records)
print()

# Close cursor and connection
cursor.close()
connection.close()
