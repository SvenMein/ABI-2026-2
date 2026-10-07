-- Mathematical Operations
SELECT COUNT(Protein_ID) FROM proteins WHERE Organism_ID = 1;
SELECT AVG(Protein_Length) FROM proteins;
SELECT COUNT(Organism_ID) FROM organisms WHERE Kingdom_ID = 1;
SELECT SUM(Protein_Length) FROM proteins;
SELECT AVG(Protein_Length) FROM proteins WHERE Mass < 15000;
SELECT AVG(Resolution) FROM structural_data WHERE R_Free IS NOT NULL;
SELECT * FROM proteins WHERE Mass > (SELECT AVG(Mass) FROM proteins);
SELECT * FROM proteins WHERE Protein_Length < (SELECT AVG(Protein_Length) FROM proteins WHERE Mass > 15000);