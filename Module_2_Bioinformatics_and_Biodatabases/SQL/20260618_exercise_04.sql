-- Logical Operators
SELECT * FROM proteins WHERE Protein_Length > 1000 AND Mass > 100000;
SELECT * FROM structural_data WHERE Resolution < 2.0 OR R_Free < 0.25;
SELECT * FROM proteins WHERE NOT Organism_ID = 4;
SELECT * FROM organisms WHERE Kingdom_ID = 1 OR Kingdom_ID = 2;
SELECT * FROM proteins WHERE Organism_ID = 3 OR Organism_ID = 28;
SELECT * FROM atom_information WHERE Charge > 0 AND Mass > 100 AND CHEBI_ID > 20000;
SELECT * FROM structures WHERE NOT Method_ID = 4;
SELECT * FROM modification_data WHERE Molecular_Weight > 125
 AND Hydrogenbond_donors > 4 
 AND Hydrogenbond_acceptors > 4;