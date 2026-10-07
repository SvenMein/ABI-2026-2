# TRP atoms
import warnings
import Bio.PDB as BP
from Bio import BiopythonWarning
warnings.simplefilter("ignore", BiopythonWarning) # Filters out warnings from Biopython.PDB

parser = BP.PDBParser()
structure = parser.get_structure("3fqk", "3fqk.pdb")
AA_counter = 1

for model in structure:
    for chain in model:
        for residue in chain:
            if residue.resname == "TRP":
                if residue.has_id("NE1"):
                    print(f"Position of NE1 in TRP {AA_counter}: {residue["NE1"].get_vector()}")
                if residue.has_id("CZ2"):
                    print(f"Position of CZ2 in TRP {AA_counter}: {residue["CZ2"].get_vector()}")
                if residue.has_id("CZ2"):
                    print(f"Position of CH2 in TRP {AA_counter}: {residue["CH2"].get_vector()}")
                print()
            AA_counter += 1