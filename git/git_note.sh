# git cheat sheet 
https://dev.to/doabledanny/git-cheat-sheet-50-commands-free-pdf-and-poster-4gcn

git pull = (git fetch + git merge) or (git fetch + git rebase)
dependent on pull.rebase = false or true

git add .
git log
git ct -m "message"

git config --global -l 
git config --global user.email "444980834@qq.com"
git config --global user.email "xwddn1994@gmail.com"
git config --global user.name "Wei Xie"

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ct commit
git config --global alias.st status

# set vscode as git default editor
git config --global core.editor "code --wait"

git config --global pull.rebase true

git config --global rebase.autoStash true # git create temporary stash entry before the rebase operation begins, and apply it after it ends.

# All ginored and untracked files are also stashed and then cleaned up with git clean
git config --global alias.staash 'stash -all'

# read git remote config file
git config -e

# count git commit in HEAD
git rev-list HEAD --count

# search string from git history
git log --patch  | less +/${searching_string}
git rev-list --all | GIT_PAGER=cat xargs git grep '${searching_string}'

# git clean local new directory
git clean -fd

# git List references in a remote repository
git ls-remote

# it allows you to ask Git to remember how you’ve resolved a hunk conflict so that the next time it sees the same conflict, Git can resolve it for you automatically.
git rerere

-u, --set-upstream    set upstream for git pull/status


set GIT_SSH=C:\PuTTY\plink.exe


# Git Reference logs (use for recover lost local commit, really useful when mess up with rebase)
git reflog

# run garbage collection
git gc 

# conditional configs
[includeIf "gitdir:~/projects/work/"]
    path = ~/projects/work/.gitconfig

[includeIf "gitdir:~/projects/ws/"]
    path = ~/projects/ws/.gitconfig

# current: branch1, rebase target branch2
current is branch2
incoming is branch1

# current branch1, merge target branch2
current is branch1
incoming is branch2
