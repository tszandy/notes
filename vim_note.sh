Vim Command

$ # Jump to end of line
0 # Jump to beginning of line
:set nu # Turn on line numbers
:set nonu # Disable line numbers
gd # Jump to local definition
gD # Jump to global definition
% # Jump to matching braket
u # undo last action
ctrl+r # redo last action
dd # delete current line
j # go down 1 line
k # go up 1 line
b # Move cursor left 1 word
B # Move cursor left 1 word (spaces separate words)
w # Move cursor right 1 word (punctuation considered a word)
W # Move cursor right 1 word (spaces separate words)
gg # Move cursor to the first line in the file 
G # Move cursor to last line in the file
i # insert at current position
I # insert at the beginning of the line
a # insert at next position
A # insert (append) at the end of the line
o # append (open) a new line below the current line
O # append (open) a new line above the current line
yy # copy current line
yy2 #copy current line twice
p # paste delete or copied
ctrl+f # Scroll page down towards end of file
ctrl+b # Scroll page up towards top of file
>> # indent (move right) line one shiftwidth
<< # de-indent (move left) line one shiftwidth

/{expression} # search expression n find next,N find previous
