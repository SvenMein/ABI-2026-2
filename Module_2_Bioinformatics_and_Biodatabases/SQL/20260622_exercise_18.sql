-- Replacing VIEWs
CREATE OR REPLACE VIEW longproteins AS
SELECT Protein_Name, Protein_Length FROM proteins
WHERE Protein_Length > (SELECT AVG(Protein_Length) from proteins);
SELECT * FROM longproteins;

CREATE OR REPLACE VIEW highresstructures_data AS
SELECT Identifier, R_Free, Resolution FROM structural_data
WHERE Resolution < (SELECT AVG(Resolution) FROM structural_data);
SELECT * FROM highresstructures_data;

CREATE OR REPLACE VIEW heavyweightproteins AS
SELECT * FROM proteins
WHERE Protein_ID IN (SELECT Protein_ID FROM proteins GROUP BY Protein_ID HAVING Mass > (SELECT AVG(Mass) FROM proteins) AND Organism_ID IN (1, 2));
SELECT * FROM heavyweightproteins;

CREATE OR REPLACE VIEW heavyweightmod AS
SELECT * FROM modification_data
WHERE Molecular_Weight > 150  AND Melting_Point IS NOT NULL;
SELECT * FROM heavyweightmod;

CREATE OR REPLACE VIEW HighResStructures AS
SELECT Identifier, Source_ID, Method_ID FROM structures
WHERE Identifier IN (SELECT Identifier FROM structural_data WHERE Resolution > (SELECT AVG(Resolution) FROM structural_data));
SELECT * FROM highresstructures;

CREATE OR REPLACE VIEW MultiDomainProteins AS
SELECT Protein_Name, Protein_Length FROM Proteins
WHERE Protein_ID IN (SELECT Protein_ID FROM domains_proteins GROUP BY Protein_ID HAVING COUNT(Domain_ID) > 1);
SELECT * FROM multidomainproteins