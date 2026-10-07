-- Combining selections
SELECT Process_Name FROM biol_processes
UNION
SELECT Function_Name FROM mol_functions;

SELECT Mass FROM atom_information
UNION
SELECT Molecular_Weight FROM modification_data;

SELECT Source_Name FROM sources
UNION
SELECT Method_Name FROM methods;

SELECT Protein_ID FROM protein_function
UNION ALL
SELECT Protein_ID FROM protein_location
UNION ALL
SELECT Protein_ID FROM protein_process
UNION ALL
SELECT Protein_ID FROM domains_proteins;