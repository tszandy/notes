# create new branch $branch_name at HEAD
git br $branch_name

# list remote branch 
git br -r 

# list local branch 
git br 

# switch branch to $branch_name
git co $branch_name

#push local branch to remote $branch_name
git push --set-upstream origin $branch_name

# set remote head to other branch $branch_name
git remote set-head origin $branch_name

# delete a branch $branch_name locally
git br -d $branch_name

# delete a branch $branch_name remotelly
git push origin --delete $branch_name

