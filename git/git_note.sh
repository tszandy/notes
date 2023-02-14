git pull = (git fetch + git merge) or (git fetch + git rebase)
dependent on pull.rebase = false or true

git add .
git log
git ct -m "message"

git config --global -l 
git config --global user.email "444980834@qq.com"
git config --global user.name "Wei Xie"

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ct commit
git config --global alias.st status

git config --global pull.rebase true

git config --global rebase.autoStash true # git create temporary stash entry before the rebase operation begins, and apply it after it ends.

# count git commit in HEAD
git rev-list HEAD --count

# search string from git history
git log --patch  | less +/${searching_string}
git rev-list --all | GIT_PAGER=cat xargs git grep '${searching_string}'
