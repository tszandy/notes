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

git stash list [<options>]
git stash show [<options>] [<stash>]
git stash drop [-q|--quiet] [<stash>]
git stash ( pop | apply ) [--index] [-q|--quiet] [<stash>]
git stash branch <branchname> [<stash>]
git stash clear
git stash [push [-p|--patch] [-S|--staged] [-k|--[no-]keep-index] [-q|--quiet]
   [-u|--include-untracked] [-a|--all] [-m|--message <message>]
   [--pathspec-from-file=<file> [--pathspec-file-nul]]
   [--] [<pathspec>...]]
git stash save [-p|--patch] [-S|--staged] [-k|--[no-]keep-index] [-q|--quiet]
   [-u|--include-untracked] [-a|--all] [<message>]

    -k, --keep-index      keep index
    -S, --staged          stash staged changes only
    -p, --patch           stash in patch mode
    -q, --quiet           quiet mode
    -u, --include-untracked
                          include untracked files in stash
    -a, --all             include ignore files
    -m, --message <message>
                          stash message
    --pathspec-from-file <file>
                          read pathspec from file
    --pathspec-file-nul   with --pathspec-from-file, pathspec elements are separated with NUL character