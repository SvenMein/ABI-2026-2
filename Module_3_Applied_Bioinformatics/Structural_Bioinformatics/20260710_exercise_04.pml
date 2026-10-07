# PyMol scripts
reinitialize
fetch 7Y5I
hide everything
show cartoon, 7Y5I
color red, 7Y5I
center 7Y5I
ray
png 20260710_exercise_04_1.png

hide everything
select Ligand, chain A and resn TLA
show_as sticks, Ligand
center Ligand
zoom Ligand
ray
png 20260710_exercise_04_2.png

hide everything
select Lig, chain A and resi 402
show_as sticks, Lig
center Lig
zoom Lig
ray
png 20260710_exercise_04_3.png