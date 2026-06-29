# Working with Strings
import re
import string
lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ' \
'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ' \
'ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in ' \
'voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, ' \
'sunt in culpa qui officia deserunt mollit anim id est laborum.'

# How long is the text?
print("The text contains", len(lorem), "characters.")

# How many words?
ls1 = re.split(" ", lorem) 
print(f"This text contains {len(ls1)} words.")

# How often does every letter appear?
alphabet = list(string.ascii_lowercase)
for letter in alphabet:
    letter_nummber = re.findall(letter, lorem)
    print(f"The letter {letter} was found {len(letter_nummber)} times.")

# How often are the words 'minim' 'anim', 'ceasar' and 'duis' appearing?
minim = len(re.findall("minim", lorem))
anim = len(re.findall("anim", lorem))
caesar = len(re.findall("caesar", lorem))
brutus = len(re.findall("brutus", lorem))
duis = len(re.findall("duis", lorem))
print(f"The word 'minim' appears {minim}, 'anim' {anim}, 'caesar' {caesar}, 'brutus' {brutus} and 'duis' {duis} times in the text.")