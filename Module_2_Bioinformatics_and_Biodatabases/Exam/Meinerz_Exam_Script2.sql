DROP DATABASE IF EXISTS exam;
CREATE DATABASE exam;
USE exam;

CREATE TABLE proteins (
	Protein_ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Protein_Name varchar(255),
    Protein_Length int,
    Annotation int,
    Mass int,
    Organism_ID int,
    Organism_Name varchar(255),
    WesternBlot_Mass int,
    Antibody_Used varchar(255),
    Antibody_Supplier varchar(255)
);

INSERT INTO proteins (
    Protein_ID, Protein_Name, Protein_Length, 
    Mass, Organism_Name, WesternBlot_Mass
    )
VALUES (0, 'SYCL1', 808, 89631, 'Human', 125000);