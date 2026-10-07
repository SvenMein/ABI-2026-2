-- Filtering Selections
SELECT * FROM proteins WHERE Protein_Length > 1000;
SELECT * FROM structures WHERE Source_ID = 1;
SELECT * FROM structural_data WHERE Resolution < 2.0;
SELECT * FROM organisms WHERE Kingdom_ID = 1;
SELECT Mass, Protein_Name, Protein_ID FROM proteins WHERE Mass < 25000;
SELECT * FROM proteins WHERE Protein_Name = 'Cytochrome c oxidase subunit 1';
SELECT * FROM atom_information WHERE Charge > 0;
SELECT * FROM atom_information WHERE 50 <= Mass AND Mass <= 150;