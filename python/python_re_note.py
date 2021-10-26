# Regular expression operations
import re

re.compile()

# if zero or more characters at the beginning of string match the regular expression pattern, return a corresponding match object
re.match(pattern, string, flags = 0)

# Scan through string looking for the first location where the regular expression pattern produces a match
re.search(pattern, string, flags = 0)


#if the whole string matches the regular expression pattern, return a corresponding match object
#python 3.4
re.fullmatch(pattern, string, flags = 0)

# split string by the occurrences of pattern
#python 3.1
re.split(pattern,string,maxspit=0,flags=0)

prog = re.compile(pattern)
result = prog.match(string)
# is equivalent to 
result = re.match(pattern,string)


