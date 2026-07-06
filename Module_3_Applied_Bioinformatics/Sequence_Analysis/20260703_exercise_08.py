# Best alignment in Python
from Bio import Align
from Bio import SeqIO

seq1 = SeqIO.read("B3JI28.fasta", "fasta")
seq2 = SeqIO.read("B4DTL8.fasta", "fasta")

scores_local = {}
scores_global = {}

# Create Aligner Object
aligner = Align.PairwiseAligner()

print(10*"#", "Local alignments", 10*"#")

ls_matrix = ["PAM250", "BLOSUM45", "MDM78", "JOHNSON", "BENNER6", "GONNET1992"]

for matrix in ls_matrix:
    print(5*"-", matrix, 5*"-")
    # Choose substition matix
    current_matrix = Align.substitution_matrices.load(matrix)
    aligner.substitution_matrix = current_matrix
    
    # set affine gap cost
    aligner.open_gap_score = 10
    aligner.extend_gap_score = -0.5

    # set alingment mode
    aligner.mode = "local"

    # Create alignments
    alignments = aligner.align(seq1, seq2)

    # Score alignments
    score = aligner.score(seq1, seq2)
    scores_local[matrix] = [score, aligner.algorithm]

    print(alignments[0])
    print()

print(10*"#", "Global alignments", 10*"#")

for matrix in ls_matrix:
    print(5*"-", matrix, 5*"-")
    # Choose substition matix
    current_matrix = Align.substitution_matrices.load(matrix)
    aligner.substitution_matrix = current_matrix
    
    # set affine gap cost
    aligner.open_gap_score = 10
    aligner.extend_gap_score = -0.5

    # set alingment mode
    aligner.mode = "global"

    # Create alignments
    alignments = aligner.align(seq1, seq2)

    # Score alignments
    score = aligner.score(seq1, seq2)
    scores_global[matrix] = [score, aligner.algorithm]

    print(alignments[0])
    print()

print(scores_local)
print()
print(scores_global)
