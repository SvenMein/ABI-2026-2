# Structural calculations
import warnings
import Bio.PDB as BP
from Bio import BiopythonWarning
warnings.simplefilter("ignore", BiopythonWarning) # Filters out warnings from Biopython.PDB
import math

parser = BP.PDBParser()
structure = parser.get_structure("7un2", "7un2.pdb")

for model in structure:
    for chain in model:
        print("##### Distance CG-OD1 in ASP #####")
        for residue in chain:
            if residue.resname == "ASP" and residue.has_id("CG") and residue.has_id("OD1"):
                distance = residue["CG"] - residue["OD1"]
                print(distance)
        print()
        print("##### Distance CG-OD2 in ASP #####")
        for residue in chain:
            if residue.resname == "ASP" and residue.has_id("CG") and residue.has_id("OD2"):
                distance = residue["CG"] - residue["OD2"]
                print(distance)
        print()
        print("##### Distance CE-ND1 in HIS #####")
        for residue in chain:        
            if residue.resname == "HIS" and residue.has_id("CE") and residue.has_id("ND1"):
                distance = residue["CE"] - residue["ND1"]
                print(distance)   
        print()
        print("##### Distance CE-NE2 in HIS #####")
        for residue in chain: 
            if residue.resname == "HIS" and residue.has_id("CE") and residue.has_id("NE2"):
                distance = residue["CE"] - residue["NE2"]
                print(distance)
        print()
        print("##### Angle CA-CB-CG1 in VAL #####")
        for residue in chain: 
            if residue.resname == "VAL" and residue.has_id("CA") and residue.has_id("CB") and residue.has_id("CG1"):
                angle = BP.calc_angle(residue["CA"].get_vector(), residue["CB"].get_vector(), residue["CG1"].get_vector()) * (180/math.pi)
                print(angle)
        print()
        print("##### Angle CE-CZ-OH in TYR #####")
        for residue in chain: 
            if residue.resname == "TYR" and residue.has_id("CE") and residue.has_id("CZ") and residue.has_id("OH"):
                angle = BP.calc_angle(residue["CE"].get_vector(), residue["CZ"].get_vector(), residue["OH"].get_vector()) * (180/math.pi)
                print(angle)
        print()
        print("##### Dihedral CG-CD-CE-NZ in LYS #####")
        for residue in chain: 
            if residue.resname == "LYS" and residue.has_id("CG") and residue.has_id("CD") and residue.has_id("CE") and residue.has_id("NZ"):
                angle = BP.calc_dihedral(residue["CG"].get_vector(), residue["CD"].get_vector(), residue["CE"].get_vector(), residue["NZ"].get_vector()) * (180/math.pi)
                print(angle)
        print()
        print("##### Dihedral CB-CG-CD-OE1 in GLN #####")
        for residue in chain: 
            if residue.resname == "GLN" and residue.has_id("CB") and residue.has_id("CG") and residue.has_id("CD") and residue.has_id("OE1"):
                angle = BP.calc_dihedral(residue["CB"].get_vector(), residue["CG"].get_vector(), residue["CD"].get_vector(), residue["OE1"].get_vector()) * (180/math.pi)
                print(angle)