# list git log
git log

# list git each commit one line
git log --pretty=oneline

# graph git commit history
git log --graph

# git check which commit change specific file
git log --follow -- ${filename}

# git blame file:line
git log -L<range>:<file_path>
