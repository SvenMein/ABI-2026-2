-- NULL Values
SELECT * FROM structural_data WHERE R_Free IS NULL;
SELECT * FROM structural_data WHERE Resolution IS NOT NULL;
SELECT * FROM domain_data WHERE Max_Repeats IS NULL;
SELECT * FROM cellular_location WHERE Location_Description IS NOT NULL;
SELECT * FROM modification_data WHERE EC_Number IS NULL;
SELECT * FROM atom_information WHERE SMILES IS NOT NULL AND Charge > 0;
SELECT * FROM modification_data WHERE Melting_Point IS NULL AND Hydrogenbond_donors >= 3 ORDER BY IUPAC_Name;
SELECT * FROM  structural_data WHERE R_Free IS NOT NULL AND Resolution IS NOT NULL ORDER BY Released;