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

# count git commit in HEAD
git rev-list HEAD --count