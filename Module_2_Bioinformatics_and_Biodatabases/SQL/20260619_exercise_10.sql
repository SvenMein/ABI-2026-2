-- Limits
SELECT * FROM proteins LIMIT 10;
SELECT * FROM organisms 
WHERE Kingdom_ID = 2 LIMIT 4;
SELECT * FROM structures 
WHERE Method_ID = 2 LIMIT 6;
SELECT * FROM proteins 
ORDER BY Protein_Length LIMIT 12;
SELECT * FROM proteins 
WHERE Organism_ID = 1 
ORDER BY Mass DESC LIMIT 5;
SELECT * FROM cellular_location 
WHERE Location_Description IS NOT NULL 
AND Gene_Ontology > 10000 LIMIT 3;
SELECT * FROM proteins 
WHERE Organism_ID = 1 
ORDER BY Mass LIMIT 4;
SELECT * FROM structures 
WHERE Source_ID = 2 
ORDER BY Identifier LIMIT 20;