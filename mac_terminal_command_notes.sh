# mac comapre two folders from two different file systems.
export PATH1=/Volumes/DISK1
export PATH2=/Volumes/DISK2

diff -rq $PATH1 $PATH2 |grep -v "\ \.\_\|\.fseventsd"

# color grep
alias grep="grep --color=always"

# mac remove all ._ 
cd ${directory_name}
dot_clean -m .

# mac zip huge folder
zip -r ${target_name}.zip ${folder_name}
