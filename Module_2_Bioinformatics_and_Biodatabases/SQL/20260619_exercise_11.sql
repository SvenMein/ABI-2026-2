-- Maximal and minimal values
SELECT MAX(Protein_Length) FROM proteins;
SELECT MIN(Resolution) FROM structural_data;
SELECT MIN(Taxonomy) FROM organisms;
SELECT MAX(Mass) FROM proteins WHERE Protein_Length < 400;
SELECT MAX(Modification_Name) FROM modifications;
SELECT MIN(Released) FROM structural_data;
SELECT * FROM proteins WHERE Protein_Length = (SELECT MIN(Protein_Length) FROM proteins);
SELECT * FROM proteins WHERE Mass = (SELECT MAX(Mass) FROM proteins);
SELECT * FROM domains WHERE Domain_ID IN (SELECT Domain_ID FROM domain_data WHERE Max_Repeats = (SELECT Min(Max_Repeats) FROM domain_data ORDER BY Prosite_Annotation));