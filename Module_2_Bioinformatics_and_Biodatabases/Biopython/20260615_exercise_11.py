
from Bio import ExPASy
from Bio import SwissProt
from Bio import UniProt
from Bio import PDB

handle = ExPASy.get_sprot_raw("Q12453")
record = SwissProt.read(handle)
print(record.sequence)
print(record.sequence_length)
print(record.organism)

results = UniProt.search("Cex1")
for record in results:
    handle = ExPASy.get_sprot_raw(results)
    record = SwissProt.read(handle)
    print(record.sequence_length)