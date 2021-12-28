git stash list
git stash show

# stash all the change to stash stack
git stash

# stash all the change to stash stack including new file
git stash -u

# either apply stash or pop stash (delete copy in stash stack)
git stash ( pop | apply ) [--index] [-q|--quiet] [<stash>]
# example 
git stash apply --index 1

# stash specific files to a index with message
git stash [push [-p|--patch] [-k|--[no-]keep-index] [-q|--quiet]
          [-u|--include-untracked] [-a|--all] [-m|--message <message>]
          [--pathspec-from-file=<file> [--pathspec-file-nul]]
          [--] [<pathspec>...]]

# git stash one file with message
git stash push filepath -m "message"
