
# regular expression literal 
const re = /ab+c/;

# calling the constructor function of the RegExp object
const re = new RegExp("ab+c");


Method	Description
exec()	Executes a search for a match in a string. It returns an array of information or null on a mismatch.
test()	Tests for a match in a string. It returns true or false.
match()	Returns an array containing all of the matches, including capturing groups, or null if no match is found.
matchAll()	Returns an iterator containing all of the matches, including capturing groups.
search()	Tests for a match in a string. It returns the index of the match, or -1 if the search fails.
replace()	Executes a search for a match in a string, and replaces the matched substring with a replacement substring.
replaceAll()	Executes a search for all matches in a string, and replaces the matched substrings with a replacement substring.
split()	Uses a regular expression or a fixed string to break a string into an array of substrings.

The "g" after the regular expression is an option or flag that performs a global search, looking in the whole string and returning all matches.
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions#advanced_searching_with_flags
