-- Creating nice VIEWs
CREATE VIEW LongProteins AS
SELECT * FROM proteins
WHERE Protein_Length > (SELECT AVG(Protein_Length) FROM proteins);
SELECT * FROM longproteins;

CREATE VIEW HighResStructures_data AS
SELECT * FROM structural_data
WHERE Resolution < (SELECT AVG(Resolution) FROM structural_data);
SELECT * FROM HighResStructures_data;

CREATE VIEW HeavyWeightProteins AS
SELECT * FROM proteins
WHERE Protein_ID IN (SELECT Protein_ID FROM proteins GROUP BY Protein_ID HAVING Mass > (SELECT AVG(Mass) FROM proteins) AND Organism_ID = 1);
SELECT * FROM HeavyWeightProteins;

CREATE VIEW HeavyWeightMod AS
SELECT * FROM modification_data
WHERE Molecular_Weight > 150 AND Melting_Point IS NOT NULL;
SELECT * FROM HeavyWeightMod;

CREATE VIEW HighResStructures AS
SELECT Identifier, Source_ID, Method_ID FROM structures
WHERE Identifier IN (SELECT Identifier FROM structural_data WHERE Resolution > (SELECT AVG(Resolution) FROM structural_data));
SELECT * FROM highresstructures;

CREATE VIEW MultiDomainProteins AS
SELECT * FROM Proteins
WHERE Protein_ID IN (SELECT Protein_ID FROM domains_proteins GROUP BY Protein_ID HAVING COUNT(Domain_ID) > 1);
SELECT * FROM multidomainproteins