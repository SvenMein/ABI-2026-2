reinitialize
fetch 9ICV, type=pdb

select atom1, resi 26 and name CA
select atom2, resi 30 and name CA
select atom3, resi 35 and name CA

distance , atom1, atom2
distance , atom1, atom3
distance , atom3, atom2

angle , atom1, atom2, atom3
angle , atom2, atom3, atom1
angle , atom3, atom1, atom2

dihedral , resi 75 and name C, resi 76 and name N, resi 76 and name CA, resi 76 and name C