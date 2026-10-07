# Measurment script
reinitialize
fetch 7QR2
remove solvent

select atom1, resi 501 and name S
select atom2, resi 502 and name S
select atom3, resi 503 and name S
select atom4, resi 504 and name S
group sulfurs, atom1 atom2 atom3 atom4

# make distance measurments
distance , resi 72 and name CA, resi 87 and name CA
distance , resi 353 and name CA, resi 370 and name CA
distance , atom1, atom2, atom3, atom4

# angles
angle , atom1, atom2, atom3
angle , atom1, atom2, atom4
angle , atom1, atom3, atom4
angle , atom2, atom3, atom4

# dihedrals
dihedral , resi 505 and name O1, resi 505 and name C1, resi 505 and name C2, resi 505 and name O2
dihedral , resi 506 and name O1, resi 506 and name C1, resi 506 and name C2, resi 506 and name O2
dihedral , resi 507 and name O1, resi 507 and name C1, resi 507 and name C2, resi 507 and name O2

center
zoom
set label_size, 40
set label_color, back
ray
png 20260710_exercise_07_1.png

hide everything, 7QR2
show spheres, sulfurs
show sticks, resi 72
show sticks, resi 87
show sticks, resi 353
show sticks, resi 370
show sticks, resi 505
show sticks, resi 506
show sticks, resi 507

center
zoom
ray
png 20260710_exercise_07_2.png