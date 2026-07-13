fetch 8I35, async=0
_ set_view (\
_     1.000000000,    0.000000000,    0.000000000,\
_     0.000000000,    1.000000000,    0.000000000,\
_     0.000000000,    0.000000000,    1.000000000,\
_     0.000000000,    0.000000000,  -50.000000000,\
_   162.240539551,  162.241287231,  162.240539551,\
_    43.801921844,   96.198066711,  -20.000000000 )
_ set_view (\
_     1.000000000,    0.000000000,    0.000000000,\
_     0.000000000,    1.000000000,    0.000000000,\
_     0.000000000,    0.000000000,    1.000000000,\
_     0.000000000,    0.000000000, -447.863739014,\
_   162.240539551,  162.241287231,  162.240539551,\
_   353.099182129,  542.628295898,  -20.000000000 )
cmd.hide("everything","all")
cmd.show_as("cartoon"   ,"8I35")
util.color_chains("(8I35)",_self=cmd)
_ viewport 2280, 1035
ray 2280, 1035, async=1
png C:/Users/Sven/Desktop/Bioinformatik/ABI-2026-2/Module_3_Applied_Bioinformatics/Structural_Bioinformatics/20260710_exercise_05_1.png, 0, 0, -1, ray=0
select ChA, chain A
cmd.show_as("sticks"    ,"ChA")
cmd.disable('ChA')
ray 2280, 1035, async=1
cmd.hide("everything","all")
cmd.show("surface"   ,"all")
ray 2280, 1035, async=1
png C:/Users/Sven/Desktop/Bioinformatik/ABI-2026-2/Module_3_Applied_Bioinformatics/Structural_Bioinformatics/20260710_exercise_05_3.png, 0, 0, -1, ray=0
