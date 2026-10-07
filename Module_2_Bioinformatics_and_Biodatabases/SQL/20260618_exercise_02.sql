-- Exercise 02: Different Values
SELECT DISTINCT Kingdom_ID FROM organisms;
SELECT DISTINCT Sec_Structure_ID FROM secondary_protein;
SELECT DISTINCT Method_ID FROM structures;
SELECT DISTINCT Protein_ID FROM modifications_proteins;
SELECT DISTINCT Protein_ID FROM structures;
SELECT DISTINCT Hetero_ID FROM iupac_names;
SELECT DISTINCT Max_Repeats FROM domain_data;