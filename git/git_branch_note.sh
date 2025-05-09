# create new branch $branch_name at HEAD
git br $branch_name

# list remote branch 
git br -r 

# list local branch 
git br 

# switch branch to $branch_name
git co $branch_name

# create new branch to $branch_name and set "new branch head" to HEAD
git co -b $branch_name

#push local branch to remote $branch_name
git push --set-upstream origin $branch_name

# set remote head to other branch $branch_name
git remote set-head origin $branch_name

# delete a branch $branch_name locally
git br -d $branch_name

# search all the local branch that contains the commit $commit
git br --contains ${commit}

# search all the remote branch that contains the commit $commit
git br -r --contains ${commit}

# delete a branch $branch_name remotelly
git push origin --delete $branch_name

# Git delete remote branches in your local repository 
git remote prune origin
git fetch --prune

# Git force change Local Branch head to commit
git br -f ${branch_name} ${commit}

# Git branch set upstream branch.
git br --set-upstream-to=${remote_name}/${remote_branch_name} ${local_branch_name}