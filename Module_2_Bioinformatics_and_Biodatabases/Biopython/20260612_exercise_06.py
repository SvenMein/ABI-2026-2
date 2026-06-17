# using Entrez.info
from Bio import Entrez
Entrez.email = ""

# print("###Gene###")
# with Entrez.einfo(db="gene") as query:
#     gene_dict = Entrez.read(query)

# print(gene_dict)
# print()
# print(gene_dict.keys())
# print()
# print(gene_dict["DbInfo"][0].keys())
# print()
# print(gene_dict["DbInfo"][0]["DbBuild"])
# print()
# print(gene_dict["DbInfo"][0]["FieldList"])
# print()
# for field in gene_dict["DbInfo"][0]["FieldList"]:
#     print(field["Name"], "-", field["FullName"], "-", field["Description"])
# print()
# print(field)
# print()

# print("###Genome###")
# with Entrez.einfo(db="genome") as query:
#     genome_dict = Entrez.read(query)
# print(genome_dict)
# print()
# print(genome_dict.keys())
# print()
# print(genome_dict["DbInfo"][0].keys())
# for field in genome_dict["DbInfo"][0]["FieldList"]:
#     print(field["Name"], "-", field["FullName"], "-", field["Description"])
# print()
# print(field)
# print()

# print("###Nucleotide###")
# with Entrez.einfo(db="nucleotide") as query:
#     nuc_dict = Entrez.read(query)
# print(nuc_dict)
# print()
# print(nuc_dict.keys())
# print()
# print(nuc_dict["DbInfo"][0].keys())
# for field in nuc_dict["DbInfo"][0]["FieldList"]:
#     print(field["Name"], "-", field["FullName"], "-", field["Description"])
# print()
# print(field)
# print()

# print("###Protein###")
# with Entrez.einfo(db="protein") as query:
#     protein_dict = Entrez.read(query)
# print(protein_dict)
# print()
# print(protein_dict.keys())
# print()
# print(protein_dict["DbInfo"][0].keys())
# for field in protein_dict["DbInfo"][0]["FieldList"]:
#     print(field["Name"], "-", field["FullName"], "-", field["Description"])
# print()
# print(field)
# print()

print("###Structure###")
with Entrez.einfo(db="structure") as query:
    structure_dict = Entrez.read(query)
print(structure_dict)
print()
print(structure_dict.keys())
print()
print(structure_dict["DbInfo"][0].keys())
for field in structure_dict["DbInfo"][0]["FieldList"]:
    print(field["Name"], "-", field["FullName"], "-", field["Description"])
print()
print(field)
print()

# print("###Pubmed###")
# with Entrez.einfo(db="pubmed") as query:
#     structure_dict = Entrez.read(query)
# print(structure_dict)
# print()
# print(structure_dict.keys())
# print()
# print(structure_dict["DbInfo"][0].keys())
# for field in structure_dict["DbInfo"][0]["FieldList"]:
#     print(field["Name"], "-", field["FullName"], "-", field["Description"])
# print()
# print(field)
# print()