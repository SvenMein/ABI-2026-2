# Linked Data
from Bio import Entrez
from Bio import SeqIO
import time
Entrez.email = ""

time.sleep(2) # helps preventing connection time outs
print("#####Gene to Pubmed#####")
protid = "6622"
with Entrez.elink(db="pubmed", dbfrom="gene", id=protid) as query:
    record = Entrez.read(query)
print(record)
print()
print(record[0].keys())
print()
print(len(record[0]["LinkSetDb"][0]["Link"]))
print(record[0]["LinkSetDb"][0]["Link"][-1]["Id"])

print("-----First ID-----")
print(record[0]["LinkSetDb"][0]["Link"][0])
with Entrez.esummary(db="pubmed", id=record[0]["LinkSetDb"][0]["Link"][0]["Id"]) as handle:
    record_first = Entrez.read(handle)
print(record_first[0]["Title"])
print()

print("-----Last ID-----")
print(record[0]["LinkSetDb"][0]["Link"][-1])
with Entrez.esummary(db="pubmed", id=record[0]["LinkSetDb"][0]["Link"][-1]["Id"]) as handle:
    record_last = Entrez.read(handle)
print(record_last[0]["Title"])
print()

print("-----Slice-----")
print(record[0]["LinkSetDb"][0]["Link"][50:53])
for elem in record[0]["LinkSetDb"][0]["Link"][50:53]:
    print(elem)
    with Entrez.esummary(db="pubmed", id=elem["Id"]) as handle:
        record_slice = Entrez.read(handle)
        print(record_slice[0]["Title"])
print()

print("#####Gene to Biosample#####")
with Entrez.elink(db="biosample", dbfrom="gene", id=protid) as query:
    record = Entrez.read(query)
print(record[0]["LinkSetDb"])