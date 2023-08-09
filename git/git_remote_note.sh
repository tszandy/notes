# git remote - Manage set of tracked repositories
# git add remote link 
git remote add ${remote_name} ${remote_repository_url}
git remote add ${remote_name} git@github.com:tszandy/${repository}.git
git remote add origin git@github.com:tszandy/${repository}.git

# git remove remote
git remote remove ${remote_name}

# git remove remote
git remote rename ${remote_name} ${new_remote_name}

# git list remote
git remote -v




git remote [-v | --verbose]
git remote add [-t <branch>] [-m <master>] [-f] [--[no-]tags] [--mirror=(fetch|push)] <name> <URL>
git remote rename [--[no-]progress] <old> <new>
git remote remove <name>
git remote set-head <name> (-a | --auto | -d | --delete | <branch>)
git remote set-branches [--add] <name> <branch>…​
git remote get-url [--push] [--all] <name>
git remote set-url [--push] <name> <newurl> [<oldurl>]
git remote set-url --add [--push] <name> <newurl>
git remote set-url --delete [--push] <name> <URL>
git remote [-v | --verbose] show [-n] <name>…​
git remote prune [-n | --dry-run] <name>…​
git remote [-v | --verbose] update [-p | --prune] [(<group> | <remote>)…​]