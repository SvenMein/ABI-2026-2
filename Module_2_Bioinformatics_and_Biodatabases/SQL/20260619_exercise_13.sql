-- Grouping selections
SELECT COUNT(Protein_ID), Sec_Structure_ID FROM secondary_protein GROUP BY Sec_Structure_ID;
SELECT COUNT(Organism_ID), Kingdom_ID FROM organisms GROUP BY Kingdom_ID;
SELECT COUNT(Identifier), Method_ID FROM structures GROUP BY Method_ID;
SELECT COUNT(Protein_ID), Domain_ID FROM domains_proteins GROUP BY Domain_ID;
SELECT SUM(Mass), Organism_ID FROM proteins GROUP BY Organism_ID;
SELECT AVG(Protein_Length), Organism_ID FROM proteins WHERE Annotation > 3 GROUP BY Organism_ID;
SELECT AVG(Resolution), Clashscore FROM structural_data WHERE R_Free IS NOT NULL GROUP BY Clashscore;
SELECT SUM(Molecular_Weight), Hydrogenbond_donors FROM modification_data GROUP BY Hydrogenbond_donors;