reinitialize 

fetch 3FQK
fetch 7T10
util.color_chains("(3FQK)",_self=cmd)
cmd.show_as("cartoon"   ,"3FQK")
util.color_chains("(7T10)",_self=cmd)
cmd.show_as("cartoon"   ,"7T10")
reinitialize 

fetch 4P5J
fetch 7Y5I
util.cba(33,"all",_self=cmd)
cmd.show_as("sticks"    ,"all")
ray 2280, 1035, async=1
reinitialize 

fetch 7PY8
fetch 7XCM
util.cbss("all","red","yellow","green",_self=cmd)
cmd.show_as("ribbon"    ,"all")
ray 2280, 1035, async=1
reinitialize 

fetch 6AMF
fetch 7QOV
cmd.spectrum("count",selection="(all)&elem C")
cmd.show_as("dots"      ,"all")
ray 2280, 1035, async=1
reinitialize 

fetch 1KIM
fetch 7UN2
util.color_chains("(all)",_self=cmd)
util.cnc("all",_self=cmd)
cmd.show_as("sticks"    ,"all")
cmd.show("cartoon"   ,"all")
ray 2280, 1035, async=1