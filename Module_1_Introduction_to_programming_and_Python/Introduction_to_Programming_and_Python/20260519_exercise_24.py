# Nested Dictionaries

proteins = {
    "A": {"Name": "GAPDH", "Length": 36, "Function":"Dehydrogenase", "Location":"Cytosol"},
    "B": {"Name": "SEC6", "Length": 100, "Function":"GTPase", "Location":"Early Endosome"},
    "C": {"Name": "LIMP2", "Length": 95, "Function":"Receptor", "Location":"Lysosome"},
    }

print(proteins)
print()
print(proteins["A"])
print()
print(proteins["B"]["Location"])