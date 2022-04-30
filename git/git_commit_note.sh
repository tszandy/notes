# git stage all change 
git add .
# git stage specific file
git add ${file_name}
# git stage interactivelly
git add -p

# git commit with message
git commit -m "${message}"

# git amend commit
git commit --amend

# git amend commit without modify message
git commit --amend --no-edit
