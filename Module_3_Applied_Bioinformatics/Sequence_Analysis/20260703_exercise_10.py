# Pairwise Comparison
from Bio import Align
from Bio import SeqIO
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.cm import get_cmap
import numpy as np

sequences = list(SeqIO.parse('Sequences_MSA_01.fasta', 'fasta'))
ids = [elem.id for elem in sequences]

# Setting up the aligner
aligner = Align.PairwiseAligner()
aligner.open_gap_score = -10
aligner.extend_gap_score = -0.5
aligner.substitution_matrix = Align.substitution_matrices.load('BLOSUM62')

# Creating the dataframe by using the names of the sequences as row and
# column names
scores = pd.DataFrame(index=ids, columns=ids)

# Iterating over the sequences with a nested loop, to allow for all
# combinations. I use enumerate to generate ongoing numbers (id1, id2),
# whicH I use to avoid duplicate calculations. the other loop variables
# seq1 and seq2 are SeqRecord objects, which I can use to calculate the
# Alignments.
for id1,seq1 in enumerate(sequences):
    for id2,seq2 in enumerate(sequences):
        # if statement to avoid duplicate calculations
        if id1 <= id2:
            # calculating the alignment and saving it in the dataframe
            # The id attribute of seq1/seq2 gives me the name of the
            # sequence and the seq attribute gives me the sequence itself
            scores.loc[seq2.id, seq1.id] = aligner.score(seq1.seq, seq2.seq)