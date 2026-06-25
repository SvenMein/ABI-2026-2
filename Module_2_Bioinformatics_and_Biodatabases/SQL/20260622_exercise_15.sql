-- Joining tables
SELECT organisms.Organism_name, kingdoms.Kingdom_Name
FROM organisms INNER JOIN kingdoms
ON organisms.Kingdom_ID=kingdoms.Kingdom_ID;

SELECT proteins.Protein_Name, proteins.Protein_Length, structures.Identifier, structures.Total_Length
FROM proteins INNER JOIN structures
ON proteins.Protein_ID=structures.Protein_ID;

SELECT hetero_atoms.Ligand_Name, atom_information.Charge, atom_information.Mass
FROM hetero_atoms INNER JOIN atom_information
ON hetero_atoms.Hetero_ID=atom_information.Hetero_ID;

SELECT modifications.Modification_Name, modification_data.Molecular_Weight, modification_data.CAS_Number, modification_data.EC_Number
FROM modifications INNER JOIN modification_data
ON modifications.Modification_ID=modification_data.Modification_ID;

SELECT organisms.Organism_name, proteins.Protein_Name, proteins.Protein_Length
FROM organisms INNER JOIN proteins
ON organisms.Organism_ID=proteins.Organism_ID
WHERE Protein_Length > 250;

SELECT organisms.Taxonomy, kingdoms.Kingdom_Name
FROM organisms
INNER JOIN kingdoms
ON organisms.Kingdom_ID=kingdoms.Kingdom_ID
WHERE kingdoms.Kingdom_ID IN (1,2,3);