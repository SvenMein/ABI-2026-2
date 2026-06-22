-- Text Patterns
SELECT * FROM proteins WHERE Protein_Name LIKE 'S%';
SELECT * FROM organisms WHERE Taxonomy LIKE '%ano%';
SELECT * FROM structures WHERE Identifier LIKE '%7';
SELECT * FROM mol_functions 
WHERE Function_Name LIKE '%DNA%' 
OR Function_Name LIKE '%RNA%';
SELECT * FROM modifications WHERE Modification_Name LIKE '%lysine%';
SELECT * FROM biol_processes WHERE Process_Name LIKE '%ATP%' 
OR Process_Name LIKE '%GTP%' 
OR Process_Name LIKE '%UTP%';
SELECT * FROM proteins WHERE Protein_Name LIKE 'H%' ORDER BY Mass DESC;
SELECT * FROM proteins WHERE Protein_Name LIKE 'C%1';