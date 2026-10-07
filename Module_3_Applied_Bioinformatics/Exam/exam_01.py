from Bio import Align
from Bio import SeqIO

# Read in sequences
seq1 = SeqIO.read("First.fasta", "fasta")
seq2 = SeqIO.read("Second.fasta", "fasta")

# Create Aligner Object
aligner = Align.PairwiseAligner()

# set alingment mode
aligner.mode = "local"

# Create alignments
alignment = aligner.align(seq1, seq2)

# Print pout the alignment
print(alignment[0])
