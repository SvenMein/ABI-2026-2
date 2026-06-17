# Searching the NCBI database
from Bio import Entrez
Entrez.email = ""

print("-----Pubmed-----")
with Entrez.esearch(db="pubmed", term='"Hepatitis C NS5B"[title] AND inhibitor[title]') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----Gene-----")
with Entrez.esearch(db="gene", term='"WNT Pathway"[all]') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----Genome-----")
with Entrez.esearch(db="genome", term='"Monkeypox"[title]') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----Pubmed-----")
with Entrez.esearch(db="pubmed", term='(Monkeypox[Title]) AND (2020[pdat])') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----Protein-----")
with Entrez.esearch(db="protein", term='Borna Virus[All Fields] AND 250:500[SLEN]') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----BioSample-----")
with Entrez.esearch(db="biosample", term='"Varicella-zoster virus"[title]') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----Structure-----")
with Entrez.esearch(db="structure", term='"pyruvate kinase"[title] AND "electron microscopy"[Experimental Method]') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----Assembly-----")
with Entrez.esearch(db="assembly", term='Orthopoxvirus monkeypox[Organism]') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()

print("-----Pseudo-----")
with Entrez.esearch(db="protein", term='(pseudokinase[All Fields] AND 800:1000[SLEN])') as query:
    record_pub = Entrez.read(query)
print(record_pub)
print(record_pub["IdList"])
print("----------------")
print()