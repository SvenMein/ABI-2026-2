# Small sequence comparison
from Bio import SeqIO

fasta1 = SeqIO.read("XP_021046627.fasta", "fasta")
fasta2 = SeqIO.read("XP_031236805.fasta", "fasta")
fasta3 = SeqIO.read("A0A8I4A5I4.fasta", "fasta")
fasta4 = SeqIO.read("ELR51227.fasta", "fasta")

counter_ij = 0
counter_jk = 0
counter_ik = 0

for i, j, k in zip(fasta1.seq, fasta2.seq, fasta3.seq):
    if i == j:
        counter_ij += 1
    if j == k:
        counter_jk += 1
    if i == k:
        counter_ik += 1

print(f"Sequence i and j share {counter_ij} identical letters ({round(counter_ij/len(fasta1)*100, 3)}%)")
print(f"Sequence j and k share {counter_jk} identical letters ({round(counter_jk/len(fasta1)*100, 3)}%)")
print(f"Sequence i and k share {counter_ik} identical letters ({round(counter_ik/len(fasta1)*100, 3)}%)")
print()

for frame in range(0, 4, 1):
    fasta1_loop = fasta1
    fasta2_loop = fasta2
    fasta3_loop = fasta3
    counter1 = 0
    counter2 = 0
    counter3 = 0
    if frame == 0:
        fasta1_loop = fasta1 + (len(fasta4)-len(fasta1))*" "
        fasta2_loop = fasta2 + (len(fasta4)-len(fasta2))*" "
        fasta3_loop = fasta3 + (len(fasta4)-len(fasta3))*" "

        for i, j, k, n in zip(fasta4, fasta1_loop, fasta2_loop, fasta3_loop):
            if i == j:
                counter1 += 1
            if i == k:
                counter2 += 1
            if i == n:
                counter3 += 1
    else:
        fasta1_loop = frame*" " + fasta1
        fasta2_loop = frame*" " + fasta2
        fasta3_loop = frame*" " + fasta3
        for i, j, k, n in zip(fasta4, fasta1_loop, fasta2_loop, fasta3_loop):
            if i == j:
                counter1 += 1
            if i == k:
                counter2 += 1
            if i == n:
                counter3 += 1

    print(10*"#", "Frame Number:", frame+1, 10*"#")
    print(f"Sequence i and j share {counter1} identical letters ({round(counter1/len(fasta4)*100, 3)}%)")
    print(f"Sequence i and k share {counter2} identical letters ({round(counter2/len(fasta4)*100, 3)}%)")
    print(f"Sequence i and n share {counter3} identical letters ({round(counter3/len(fasta4)*100, 3)}%)")
    print()