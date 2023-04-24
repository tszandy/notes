# mac comapre two folders from two different file systems.
export PATH1=/Volumes/DISK1
export PATH2=/Volumes/DISK2

diff -rq $PATH1 $PATH2 |grep -v "\ \.\_\|\.fseventsd"
