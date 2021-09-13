# command substitution
$(command)

# variable substitution
${variable}



# activete debugging mode. print command trace before executing command.
set -x
# stop debugging mode
set +x

# prints shell input lines as they are read.
set -v
# stop prints
set +v

# disable file name generation using metacharacters.(globbing)
set -f
example: >ls *
ls: *: No such file or directory
# stop disable file name generation
set +f

# run bash file with option -x -v above
#!/bin/bash -xv

#delete the variables during bash execution
unset variable

# if Primary_expressions is true then execut program
if Primary_expressions; then
	program
fi

Primary_expressions define as:
[ -a FILE ]	# True if FILE exists.
[ -b FILE ]	# True if FILE exists and is a block-special file.
[ -c FILE ]	# True if FILE exists and is a character-special file.
[ -d FILE ]	# True if FILE exists and is a directory.
[ -e FILE ]	# True if FILE exists.
[ -f FILE ]	# True if FILE exists and is a regular file.
[ -g FILE ]	# True if FILE exists and its SGID bit is set.
[ -h FILE ]	# True if FILE exists and is a symbolic link.
[ -k FILE ]	# True if FILE exists and its sticky bit is set.
[ -p FILE ]	# True if FILE exists and is a named pipe (FIFO).
[ -r FILE ]	# True if FILE exists and is readable.
[ -s FILE ]	# True if FILE exists and has a size greater than zero.
[ -t FD ]	# True if file descriptor FD is open and refers to a terminal.
[ -u FILE ]	# True if FILE exists and its SUID (set user ID) bit is set.
[ -w FILE ]	# True if FILE exists and is writable.
[ -x FILE ]	# True if FILE exists and is executable.
[ -O FILE ]	# True if FILE exists and is owned by the effective user ID.
[ -G FILE ]	# True if FILE exists and is owned by the effective group ID.
[ -L FILE ]	# True if FILE exists and is a symbolic link.
[ -N FILE ]	# True if FILE exists and has been modified since it was last read.
[ -S FILE ]	# True if FILE exists and is a socket.
[ FILE1 -nt FILE2 ]	# True if FILE1 has been changed more recently than FILE2, or if FILE1 exists and FILE2 does not.
[ FILE1 -ot FILE2 ]	# True if FILE1 is older than FILE2, or is FILE2 exists and FILE1 does not.
[ FILE1 -ef FILE2 ]	# True if FILE1 and FILE2 refer to the same device and inode numbers.
[ -o OPTIONNAME ]	# True if shell option "OPTIONNAME" is enabled.
[ -z STRING ]	# True of the length if "STRING" is zero.
[ -n STRING ] or [ STRING ]	# True if the length of "STRING" is non-zero.
[ STRING1 == STRING2 ]	# True if the strings are equal. "=" may be used instead of "==" for strict POSIX compliance.
[ STRING1 != STRING2 ]	# True if the strings are not equal.
[ STRING1 < STRING2 ]	# True if "STRING1" sorts before "STRING2" lexicographically in the current locale.
[ STRING1 > STRING2 ]	# True if "STRING1" sorts after "STRING2" lexicographically in the current locale.
[ ARG1 OP ARG2 ]	"OP" is one of -eq, -ne, -lt, -le, -gt or -ge. These arithmetic binary operators return # true if "ARG1" is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to "ARG2", respectively. "ARG1" and "ARG2" are integers.

# bash for loop for VARIABLE in List do program with VARIABLE
for VARIABLE in 1 2 3 4 5 .. N do
	program
done

# bash switch
case $VARIABLE in 
	[1-6]*)
	program1
	;;
	[7-8]*)
	program2
	;;
	*)
	program3
	;;
esac

#Reserved Bourne shell variables
CDPATH   # A colon-separated list of directories used as a search path for the cd built-in command.
HOME     # The current user's home directory; the default for the cd built-in. The value of this variable is
also     # used by tilde expansion.
IFS      # A list of characters that separate fields; used when the shell splits words as part of expansion.
MAIL     # If this parameter is set to a file name and the MAILPATH variable is not set, Bash informs the
user     # of the arrival of mail in the specified file.
MAILPATH # A colon-separated list of file names which the shell periodically checks for new mail.
OPTARG   # The value of the last option argument processed by the getopts built-in.
OPTIND   # The index of the last option argument processed by the getopts built-in.
PATH     # A colon-separated list of directories in which the shell looks for commands.
PS1      # The primary prompt string. The default value is "'\s-\v\$ '".
PS2      # The secondary prompt string. The default value is "'> '".

# Special bash variables
$* # Expands to the positional parameters, starting from one. When the expansion occurs within double quotes, it expands to a single word with the value of each parameter separated by the first character of the IFS special variable.
$@ # Expands to the positional parameters, starting from one. When the expansion occurs within double quotes, each parameter expands to a separate word.
$# # Expands to the number of positional parameters in decimal.
$? # Expands to the exit status of the most recently executed foreground pipeline.
$- # A hyphen expands to the current option flags as specified upon invocation, by the set built-in command, or those set by the shell itself (such as the -i).
$$ # Expands to the process ID of the shell.
$! # Expands to the process ID of the most recently executed background (asynchronous) command.
$0 # Expands to the name of the shell or shell script.
$_ # The underscore variable is set at shell startup and contains the absolute file name of the shell or script being executed as passed in the argument list. Subsequently, it expands to the last argument to the previous command, after expansion. It is also set to the full pathname of each command executed and placed in the environment exported to that command. When checking mail, this parameter holds the name of the mail file.
