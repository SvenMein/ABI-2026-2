-- HAVING or WHERE?
SELECT COUNT(Domain_ID), Domain_ID FROM domains_proteins GROUP BY Domain_ID HAVING COUNT(Protein_ID) >= 10;
SELECT COUNT(Protein_ID), Mol_Function_ID FROM protein_function GROUP BY Mol_Function_ID HAVING COUNT(Protein_ID) > 1;
SELECT COUNT(Organism_ID), Kingdom_ID FROM organisms GROUP BY Kingdom_ID HAVING COUNT(Organism_ID) > 1;
SELECT COUNT(Protein_ID), Modification_ID FROM modifications_proteins GROUP BY Modification_ID HAVING COUNT(Protein_ID) > 19;
SELECT SUM(Mass), Organism_ID FROM proteins GROUP BY Organism_ID HAVING SUM(Mass) > 100000;
SELECT AVG(Protein_Length), Organism_ID FROM proteins GROUP BY Organism_ID HAVING AVG(Protein_Length) < 350;
SELECT * FROM Organisms WHERE Organism_ID IN (SELECT Organism_ID FROM proteins GROUP BY Organism_ID HAVING AVG(Protein_Length) < 350);