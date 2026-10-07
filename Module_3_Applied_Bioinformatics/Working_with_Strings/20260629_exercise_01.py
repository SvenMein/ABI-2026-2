# Simple Strings
s1 = "AAAAAAAAAAAAAAAAA"
s2 = "ACTGACTGACTGACTGACTG"
s3 = "HAIMGVVFTWIMALACAAPPLVGWSRY"
s4 = "SSSIYNPVIYIMLNKQFRNCMLTTLCCGKNPLG"
s5 = "PFSNVTGVVRSPFEQPQYYLAEPWQFSMLAAYMFLLIVLGFPINFLTLYVTVQH"

print("##### Length of Strings #####")
print(f"Length of string s1: {len(s1)}")
print(f"Length of string s2: {len(s2)}")
print(f"Length of string s3: {len(s3)}")
print(f"Length of string s4: {len(s4)}")
print(f"Length of string s5: {len(s5)}")
print()

print("##### Letters at certain positions #####")
print(f"Letter at position 0:\ns1: {s1[0]}\ns2: {s2[0]}\ns3: {s3[0]}\ns4: {s4[0]}\ns5: {s5[0]}")
print()
print(f"Letter at position 5:\ns1: {s1[5]}\ns2: {s2[5]}\ns3: {s3[5]}\ns4: {s4[5]}\ns5: {s5[5]}")
print()
print(f"Letter at position 10:\ns1: {s1[10]}\ns2: {s2[10]}\ns3: {s3[10]}\ns4: {s4[10]}\ns5: {s5[10]}")
print()
print(f"Letter at position 15:\ns1: {s1[15]}\ns2: {s2[15]}\ns3: {s3[15]}\ns4: {s4[15]}\ns5: {s5[15]}")
print()
print(f"Letter at position 20:\ns3: {s3[20]}\ns4: {s4[20]}\ns5: {s5[20]}")
print()
print(f"Letter at position 25:\ns3: {s3[25]}\ns4: {s4[25]}\ns5: {s5[25]}")
print()

print("##### Creation of substrings #####")
print("Substrings S-5-20")
sub1 = s1[5:20]
sub2 = s2[5:20]
sub3 = s3[5:20]
sub4 = s4[5:20]
sub5 = s5[5:20]
print(f"s1: {sub1}\ns2: {sub2}\ns3: {sub3}\ns4: {sub4}\ns5: {sub5}")
print()

print("Substrings S-20-30")
sub1 = s1[20:30]
sub2 = s2[20:30]
sub3 = s3[20:30]
sub4 = s4[20:30]
sub5 = s5[20:30]
print(f"s1: {sub1}\ns2: {sub2}\ns3: {sub3}\ns4: {sub4}\ns5: {sub5}")
print()

print("Substrings S-2-10")
sub1 = s1[2:10]
sub2 = s2[2:10]
sub3 = s3[2:10]
sub4 = s4[2:10]
sub5 = s5[2:10]
print(f"s1: {sub1}\ns2: {sub2}\ns3: {sub3}\ns4: {sub4}\ns5: {sub5}")
print()
