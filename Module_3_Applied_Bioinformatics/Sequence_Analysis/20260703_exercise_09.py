# TRUD domains in Python
from Bio import Align
from Bio import SeqIO

seq1 = SeqIO.read("Q96PZ0.fasta", "fasta")
seq2 = SeqIO.read("A0A5N3XQ52.fasta", "fasta")
seq3 = SeqIO.read("A0A9D3NLI7.fasta", "fasta")
seq4 = SeqIO.read("M3Z3I3.fasta", "fasta")

align_methods = ["local", "global"]
seq_list = [seq2, seq3, seq4]

results = {}
results_gaps = {}
results_identities = {}
results_mismatches = {}

# Create Aligner Object
aligner = Align.PairwiseAligner()
aligner.open_gap_score = 10
aligner.extend_gap_score = -0.5

for elem in align_methods:
    print(10*"#", elem, 10*"#")
    results[elem] = {}
    results_gaps[elem] = {}
    results_identities[elem] = {}
    results_mismatches[elem] = {}

    # Choose substition matix
    blosum62 = Align.substitution_matrices.load("BLOSUM62")
    aligner.substitution_matrix = blosum62

    # set alignment method
    aligner.mode = elem

    counter = 1
    # create alignments
    for seq in seq_list:
        print(5*"-", seq.id, 5*"-")
        alignments = aligner.align(seq1, seq)
        # Score alignments
        score = aligner.score(seq1, seq)
        counter += 1
        results[elem]["seq"+ str(counter)] = score
        results_gaps[elem]["seq"+ str(counter)] = alignments[0].counts().gaps
        results_identities[elem]["seq"+ str(counter)] = alignments[0].counts().identities
        results_mismatches[elem]["seq"+ str(counter)] = alignments[0].counts().mismatches
        print()

print("Scores:")
print(results)
print()
print("Gaps:")
print(results_gaps)
print()
print("Idetities:")
print(results_identities)
print()
print("Mismatches:")
print(results_mismatches)