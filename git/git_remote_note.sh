# git add remote link 
git remote add ${remote_name} git@github.com:tszandy/${repository}.git
git remote add origin git@github.com:tszandy/${repository}.git

# push local branch to remote
git push --set-upstream ${remote_name} ${branch_name}
