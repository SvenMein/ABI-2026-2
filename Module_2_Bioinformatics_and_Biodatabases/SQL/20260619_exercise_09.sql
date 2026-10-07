-- Ranges
SELECT * FROM proteins WHERE Mass BETWEEN 25000 AND 50000;
SELECT * FROM structural_data WHERE Resolution BETWEEN 2.1 AND 2.8;
SELECT * FROM organisms WHERE Organism_name BETWEEN 'S. flexneri' AND 'V. cholerae';
SELECT * FROM domains WHERE Domain_Name BETWEEN 'FE binding site' AND 'MG binding site';
SELECT * FROM proteins WHERE Protein_Length BETWEEN 100 AND 200 ORDER BY Protein_Name;
SELECT * FROM structural_data WHERE Released BETWEEN '1995-01-01' AND '1998-12-31';
SELECT * FROM proteins WHERE Protein_Length BETWEEN 300 AND 600 AND Mass < 50000;
SELECT * FROM structures WHERE Identifier IN (SELECT Identifier FROM structural_data WHERE Sidechain_outl BETWEEN 0 AND 1 AND Resolution < 2.0);