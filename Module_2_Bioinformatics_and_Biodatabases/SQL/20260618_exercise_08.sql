-- Using IN
SELECT * FROM proteins WHERE Organism_ID IN (1, 3, 28, 21, 22);
SELECT * FROM organisms WHERE Kingdom_ID IN (1, 2, 3, 4, 8);
SELECT Organism_name FROM organisms WHERE Organism_ID IN (SELECT Organism_ID FROM proteins WHERE Protein_ID IS NOT NULL);
SELECT * FROM iupac_names WHERE Hetero_ID IN (1, 6, 7, 14);
SELECT * FROM proteins WHERE Protein_ID IN (SELECT Protein_ID FROM structures WHERE Source_ID = 1);
SELECT Protein_Name FROM proteins WHERE Protein_ID IN 
	(
	SELECT Protein_ID FROM structures WHERE Identifier IN 
		(
		SELECT Identifier FROM structural_data WHERE Resolution IS NOT NULL
		)
	);
SELECT Protein_Name FROM proteins WHERE Protein_ID IN
	(
	SELECT Protein_ID FROM protein_location WHERE Location_ID IN
		(
		SELECT Location_ID FROM cellular_location WHERE Location_Description IS NOT NULL
		)
	);
SELECT Protein_Name FROM proteins WHERE Protein_ID IN
	(
    SELECT Protein_ID FROM modifications_proteins WHERE Modification_ID IN
		(
        SELECT Modification_ID FROM modification_data WHERE Melting_Point IS NOT NULL
        )
    );