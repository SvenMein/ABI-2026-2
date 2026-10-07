-- Ordering selections
SELECT * FROM proteins ORDER BY Protein_Length;
SELECT * FROM proteins ORDER BY Mass DESC;
SELECT * FROM proteins WHERE Organism_ID = 4 ORDER BY Annotation;
SELECT * FROM structures WHERE Source_ID = 2 ORDER BY Identifier;
SELECT * FROM organisms ORDER BY Taxonomy DESC;
SELECT * FROM structural_data ORDER BY Ramachandran_outl, Sidechain_outl DESC;
SELECT * FROM modification_data ORDER BY Hydrogenbond_donors, Hydrogenbond_acceptors;
SELECT * FROM domain_data WHERE Max_Repeats > 1 ORDER BY Min_Size;