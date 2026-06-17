# Creating summaries
from Bio import Entrez
Entrez.email = ""

with Entrez.esummary(db="pubmed", id="25562845") as handle:
    record = Entrez.read(handle)
print(record[0]["Title"])
print()

with Entrez.esummary(db="gene", id="21926") as handle:
    record = Entrez.read(handle)
print(record["DocumentSummarySet"]["DocumentSummary"][0]["Name"])
print()

with Entrez.esummary(db="gene", id="40699") as handle:
    record = Entrez.read(handle)
print(record["DocumentSummarySet"]["DocumentSummary"][0]["Name"])
print()

with Entrez.esummary(db="gene", id="595") as handle:
    record = Entrez.read(handle)
print(record["DocumentSummarySet"]["DocumentSummary"][0]["Name"])
print()

with Entrez.esummary(db="genome", id="82219") as handle:
    record = Entrez.read(handle)
print(record[0]["Organism_Name"])
print()

with Entrez.esummary(db="pubmed", id="37426289") as handle:
    record = Entrez.read(handle)
print(record[0]["Title"])
print()

with Entrez.esummary(db="pubmed", id="36814644") as handle:
    record = Entrez.read(handle)
print(record[0]["Title"])
print()

with Entrez.esummary(db="protein", id="215981657") as handle:
    record = Entrez.read(handle)
print(record[0]["Title"])
print()

with Entrez.esummary(db="protein", id="215981655") as handle:
    record = Entrez.read(handle)
print(record[0]["Title"])
print()

with Entrez.esummary(db="biosample", id="23498700") as handle:
    record = Entrez.read(handle)
print(record["DocumentSummarySet"]["DocumentSummary"][0]["Title"])
print()

with Entrez.esummary(db="biosample", id="4623491") as handle:
    record = Entrez.read(handle)
print(record["DocumentSummarySet"]["DocumentSummary"][0]["Title"])
print()

with Entrez.esummary(db="structure", id="231743") as handle:
    record = Entrez.read(handle)
print(record[0]["PdbDescr"])
print()