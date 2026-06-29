# A bit more about strings
import re

lorem = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ' \
'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ' \
'ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in ' \
'voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, ' \
'sunt in culpa qui officia deserunt mollit anim id est laborum.'

lorem = lorem.replace("et", "at")
lorem = lorem.replace("in", "on")
lorem = lorem.replace("eu", "au")
print(lorem)
print()
lorem_upper = lorem.upper()
lorem_lower = lorem.lower()
print(lorem_upper)
print(lorem_lower)
print()

lorem_split = re.split(" ", lorem)
print(lorem_split)
print()
lorem_new = ""
for word in lorem_split:
    lorem_new += word
print(lorem_new)