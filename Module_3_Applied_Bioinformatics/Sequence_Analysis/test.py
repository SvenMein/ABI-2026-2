from Bio import SeqIO
from Bio import Entrez
import os
Entrez.email = ""

ls = []
with open("SCY_family_proteins.fasta") as handle:
    for record in SeqIO.parse(handle, "fasta"):
        # print(record.id, "Length:", len(record))
        identifier_long = str(record.id)
        identifier_short = identifier_long.split("|")
        ls.append(identifier_short[1])

with open("SCY_family_uniprot_id.txt", "w") as with_file:
    for elem in ls:
        with_file.write(str(elem)+"\n")
