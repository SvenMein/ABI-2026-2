from Bio import Entrez
import time
Entrez.email = ""

time.sleep(2) # helps preventing connection time outs

print("##### First ID #####")
with Entrez.esummary(db="nucleotide", id="EU500707") as handle:
    record = Entrez.read(handle)
# print(record[0]["Title"])
print(record)
print()

print("##### Second ID #####")
with Entrez.esummary(db="nucleotide", id="EU500709") as handle:
    record = Entrez.read(handle)
print(record)
# print(record[0]["Title"])
print()