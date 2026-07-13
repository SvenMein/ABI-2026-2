# Atom Coordinates
import warnings
import Bio.PDB as BP
from Bio import BiopythonWarning
warnings.simplefilter("ignore", BiopythonWarning) # Filters out warnings from Biopython.PDB

parser = BP.PDBParser()
structure = parser.get_structure("6anf", "6anf.pdb")

model = [5, 10, 1, 8, 2, 18]
resn = [12, 5, 9, 10, 7, 3]
atom_name = ["CA", "OE1", "CB", "CZ", "HG2", "CG"]

for state, res_numb, atom in zip(model, resn, atom_name):
    print(structure[state - 1]["A"][res_numb][atom].get_vector())