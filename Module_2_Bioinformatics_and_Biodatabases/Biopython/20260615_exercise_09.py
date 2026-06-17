# Fetching Data
from Bio import Entrez
from Bio import SeqIO
Entrez.email = ""

with Entrez.efetch(db="protein", id="215981655", retmode="text", rettype="gb") as handle:
    record1 = SeqIO.read(handle, "genbank")
print(record1)
print(record1.seq)
print()

with Entrez.efetch(db="protein", id="215981657", rettype="fasta", retmode="text") as handle:
    record1 = SeqIO.read(handle, "fasta")
print(record1)
print(record1.seq)
print()

with Entrez.efetch(db="nucleotide", id="CP046095", rettype="gb", retmode="text") as handle:
    record1 = SeqIO.read(handle, "genbank")
print(record1.id)
print(record1.seq)
print(record1.features)
print()

with Entrez.efetch(db="nucleotide", id="EU490707", rettype="fasta", retmode="text") as handle:
    record3 = SeqIO.read(handle, "fasta")
print(record3.id)
print(record3.seq)
print(record3.features)

with Entrez.efetch(db="pubmed", id="2301859", rettype="abstract", retmode="text") as handle:
    record4 = handle.read()
    for line in handle:
        print(line)

print(record4)
print()

with Entrez.efetch(db="pubmed", id="2301859", retmode="xml") as handle:
    record5 = Entrez.read(handle)
    
print(record5)
print()
print(record5.keys())
print()
print(record5['PubmedArticle'])
print()
print(record5['PubmedArticle'][0].keys())
print()
print(record5['PubmedArticle'][0]['PubmedData'])