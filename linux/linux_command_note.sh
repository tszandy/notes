Linux System

ctrl + alt + f${n} # switch to tty${n} (n = 1-6) switch to gui n=7

echo "${username}:${password}" | chpasswd # change password of username need root access

usermod -aG sudo ${username} # add user to the sudo group

cd # go to home directory

cd - # go to previous location 

man ${command} # manual pages of ${command}

which ${command} # where is the ${command}

pwd # print working directory 

ls  # lists the contents of a directory 

cp # copies files 

mv # renames a file 

touch # create an empty file 

rm # delete (remove) a file 

echo # prints its arguments to the standard output 

cd # change directory

mkdir # make directory

rmdir # remove directory

grep # prints the lines from a file or input stream 
Ex; grep ${input_stream} ${file}, grep root /etc/passwd

less # see the contents of the file one screenful at a time 

diff # differences between two text files 
file # see format of file 

find # find certain file 
ex: find ${path} -name ${file_name} 

head, tail # quickly view a portion of a file or stream of data ,the -n option, where n is the number of lines you want to see 

sort # puts the lines of a text file in alphanumeric order numeri- cal order, use the -n option. The -r option reverses the order of the sort. 

passwd # command to change your password 

chsh # change your shell, ex:ksh or tcsh 

export # Assign an environment variable 
Ex export STUFF=blah

PATH # a special environment variable that contains the command path 

man -k keyword # search for a manual page by keyword 
ex: man -k sort

0: stdin
1: stdout
2: stderr

ls /fffffffff > f 2> e # send standard output to f and standard error to e, use the 2> syntax, 

send the standard error to the same place as stdout with the >& notation 
Ex: send both standard output and standard error to the file named f,:
ls /fffffffff > f 2>&1 

channel a file to a program’s standard input, use the < operator: 
head < /proc/cpuinfo 

ps x # Show all of your running processes.
ps ax # Show all processes on the system, not just the ones you own. 
ps u # Include more detailed information on processes.
ps w # Show full command names, not just what fits on one line. 

kill pid # terminate a process 
kill -STOP pid # freeze a process instead of terminating it 
kill -CONT pid # the CONT signal to continue running the process again 
CTRL-Z # suspend processes 
fg # bring back suspend processes
jobs # list suspend processes

CTRL-C # kill processes

running command in background    
you can detach a process from the shell and put it in the “background” with the ampersand (&) 
The dark side of running background processes is that they may expect to work with the standard input (or worse, read directly from the terminal) 
If a program tries to read something from the standard input when it’s in the background, it can freeze (try fg to bring it back) or terminate. Also,if the program writes to the standard output or standard error, the output can appear in the terminal window with no regard for anything else run- ning there, meaning that you can get unexpected output when you’re work- ing on something else. 
The best way to make sure that a background process doesn’t bother you is to redirect its output (and possibly input) 

ln -s target linkname # create a symbolic link from target to linkname 

gunzip file.gz # uncompress <file>.gz 
gzip file # compress it again 

tar cvf archive.tar file1 file2 # create archives of files 

tar xvf archive.tar # unpack a .tar file 

gunzip file.tar.gz 
tar xvf file.tar 
# extract file.tar.gz

zcat file.tar.gz | tar xvf - # zcat command is the same as gunzip -dc 

/bin # including most of the basic Unix commands such as ls and cp 

/dev # Contains device files

/etc # This core system configuration directory 

/home # Holds personal directories for regular users 

/lib # this directory holds library files con- taining code that executables can use. There are two types of libraries: static and shared 

/proc # Provides system statistics through a browsable directory-and-file interface 

/sys # provides a device and system interface 

/sbin # Programs in /sbin directories relate to system management 

/tmp # A storage area for smaller, temporary files 

/usr # contains a large directory hierarchy, including the bulk of the Linux system 

/var # where programs record runtime infor- mation. System logging, user tracking, caches, and other files that system programs create and manage are here. 

/boot Contains kernel boot loader files 

/media base attachment point for removable media 

/opt # contain additional third-party software 

/include Holds header files used by the C compiler. 

/info Contains GNU info manuals 

/local Is where administrators can install their own software 

/man Contains manual pages. 

/share Contains files that should work on other kinds of Unix machines with no loss of functionality 

On Linux systems, the kernel is normally in /vmlinuz or /boot/vmlinuz 

ls -l 
brw-rw----  1 root disk 8, 1 Sep  6 08:37 sda1
crw-rw-rw- 1 root root 1, 3 Sep  6 08:37 null
prw-r--r--   1 root root    0 Mar  3 19:17 fdata
srw-rw-rw- 1 root root    0 Dec 18 07:43 log
character is b, c, p, or s, the file is a device. These letters stand for block, character, pipe, and socket 
Block device 
    Programs access data from a block device in fixed chunks. The sda1 in the preceding example is a disk device 
Character device 
    Character devices work with data streams. You can only read characters from or write characters to character devices, as previously demonstrated with /dev/null 
Pipe device 
    Named pipes are like character devices, with another process at the other end of the I/O stream instead of a kernel driver. 
Socket device 
    Sockets are special-purpose interfaces that are frequently used for interprocess communication. 

Not all devices have device files because the block and character device I/O interfaces are not appropriate in all cases 

The base path for devices is /sys/devices. For example, the SATA hard disk at /dev/sda might have the following path in sysfs: 
/sys/devices/pci0000:00/0000:00:1f.2/host0/target0:0:0/0:0:0:0/block/sda 

Use the udevadm command to show the path and other attributes: 
udevadm info --query=all --name=/dev/sdaThe udevadm program is in /sbin 

dd copies data in blocks of a fixed size 
dd if=/dev/zero of=new_file bs=1024 count=1 

mount # mount file systems

lsscsi # list the SCSI devices on your system ,Small Computer System Interface (SCSI) was orig- inally developed as a hardware and protocol standard for communication 

lsscsi[0:0:0:0]u diskv ATA WDC WD3200AAJS-2 01.0 /dev/sdaw [1:0:0:0] cd/dvd Slimtype DVD A DS8A5SH XA15 /dev/sr0 [2:0:0:0] disk FLASH Drive UT_USB20 0.00 /dev/sdb 

If you were referring to the device names directly in the fstab file (see Section 4.2.8), you’d have to make some changes to that file in order to get things (mostly) back to normal. To solve this problem, most modern Linux systems use the Universally Unique Identifier (UUID, see Section 4.2.4) for persistent disk device access. 

CD and DVD Drives: /dev/sr* 

PATA Hard Disks: /dev/hd* 

Terminals: /dev/tty*, /dev/pts/*, and /dev/tty 

Linux has two primary display modes: text mode and an X Window System server 

Serial Ports: /dev/ttyS* 

Parallel Ports: /dev/lp0 and /dev/lp1 

Audio Devices: /dev/snd/*, /dev/dsp, /dev/audio, and More 

mknod # command creates one device 
Ex: mknod /dev/sda1 b 8 2 

devtmpfs  filesystem was developed in response to the problem of device availability during boot 

￼

There are many kinds of partition tables. The traditional table is the one found inside the Master Boot Record (MBR). A newer standard starting to gain traction is the Globally Unique Identifier Partition Table (GPT). 

parted A text-based tool that supports both MBR and GPT. 

gparted A graphical version of parted. 

fdisk The traditional text-based Linux disk partitioning tool. fdisk does not support GPT. 

gdisk A version of fdisk that supports GPT but not MBR. 

parted -l  # view your system’s partition table 


The Fourth Extended filesystem (ext4) is the current iteration of a line of filesystems native to Linux. 
The Second Extended filesystem (ext2) was a longtime default for Linux systems inspired by traditional Unix file- systems such as the Unix File System (UFS) and the Fast File System (FFS). 
The Third Extended filesystem (ext3) added a journal feature (a small cache outside the normal filesystem data structure) to enhance data integrity and hasten booting. 
ISO 9660 (iso9660) is a CD-ROM standard. Most CD-ROMs use some variety of the ISO 9660 standard. 
FAT filesystems (msdos, vfat, umsdos) pertain to Microsoft systems. 

HFS+ (hfsplus) is an Apple standard used on most Macintosh systems. mkfs utility can create many kinds of filesystems. 
you can create an ext4 partition on /dev/sdf2 with this command: 
mkfs -t ext4 /dev/sdf2 

mount # To learn the current filesystem status of your system 

mount -t type device mountpointmount -t ext4 /dev/sdf2 /home/extra You normally don’t need to supply the -t type option because mount can usually figure it out for you 
umount mountpoint # To unmount (detach) a filesystem, use the umount command: 
blkid # To view a list of devices and the corresponding filesystems and UUIDs on your system, use the blkid (block ID) program: 

To mount a filesystem by its UUID 
mount UUID=a9011c2b-1c03-4288-b3fe-8ba961ab0898 /home/extra 

Disk Buffering, Caching, and Filesystems 
the kernel usually doesn’t immediately write changes to filesystems when pro- cesses request changes. Instead it stores the changes in RAM until the kernel can conveniently make the actual change to the disk. 
When you unmount a filesystem with umount, the kernel automatically synchronizes with the disk. At any other time, you can force the kernel to write the changes in its buffer to the disk by running the sync command. 

-r The -r option mounts the filesystem in read-only mode. 
-n The -n option ensures that mount does not try to update the system runtime mount database, /etc/mtab. The mount operation fails when it cannot write to this file, which is important at boot time because the root partition (and, therefore, the system mount database) is read-only at first. You’ll also find this option handy when trying to fix a system problem in single-user mode, because the system mount database may not be available at the time. 
-t The -t type option specifies the filesystem type. 

The most useful long options are these: 
exec, noexec Enables or disables execution of programs on the filesystem. 
suid, nosuid Enables or disables setuid programs. 
ro Mounts the filesystem in read-only mode (as does the -r short option). 
rw Mounts the filesystem in read-write mode. 
conv=rule (FAT-based filesystems) Converts the newline charactersin files based on rule, which can be binary, text, or auto.
mount -n -o remount /  # command remounts the root in read-write mode 

The /etc/fstab Filesystem Table 
Linux systems keep a permanent list of filesystems and options in /etc/fstab 

When using mount, you can take some shortcuts if the filesystem you want to work with is in /etc/fstab 

df # display free disk space

fsck # Checking and Repairing Filesystems 
Ex: fsck /dev/sdb1 

The special filesystem types in common use on Linux :
proc Mounted on /proc. The name proc is actually an abbreviation for process. 
sysfs Mounted on /sys. 
tmpfs Mounted on /run and other locations. 

Boot Loader Overview 
GRUB A near-universal standard on Linux systemsLILO One of the first Linux boot loaders. ELILO is a UEFI version 
SYSLINUX Can be configured to run from many different kinds of filesystems 
LOADLIN Boots a kernel from MS-DOSefilinux A UEFI boot loader intended to serve as a model and refer- 
ence for other UEFI boot loaders 
coreboot (formerly LinuxBIOS) A high-performance replacement for the PC BIOS that can include a kernel 
Linux Kernel EFISTUB A kernel plugin for loading the kernel directly from the EFI/UEFI System Partition (ESP) found on recent systems 

who -r # check your system’s runlevel 

shutdown -h now 

shutdown -r +10 # system reboot in 10 minutes 

syslogd # system log 
/var/log # where system log store

/etc/passwd # maps usernames to user IDs 

An x in the second passwd file field indicates that the encrypted password is stored in the shadow file. A star (*) indicates that the user cannot log in, and if the field is blank (that is, you see two colons in a row, like ::), no password is required to log in. (Beware of blank pass- words. You should never have a user without a password.) 
￼

Special Users 
The superuser (root) always has UID 0 and GID 0 
The nobody user is an underprivileged user. Some pro- cesses run as nobody because the nobody user cannot write to anything on the system. 

/etc/shadow # The shadow password file (/etc/shadow) on a Linux system normally contains user authentication information, including the encrypted passwords and password expiration information that correspond to the users in /etc/passwd. 

passwd user # set a user’s password,  as the superuser. 
adduser, userdel # add and remove users. 

/etc/group file defines the group IDs 
￼

ps # command lists current processes, but it does little to tell you how processes change over time. 

top # program is often more useful than ps because it displays the current system status as well as many of the fields in a ps listing 
top doesn’t show threads by default; you’ll need to press H to turn it on 
use f to change the displayed fields and u to display the number of major page faults 

lsof # command lists open files and the processes using them 

lsof /usr #You can use command-line options to provide a filename as an argument and have lsof list only the entries that match the argument 
lsof -p pid  # To list the open files for a particular process ID, run: 
ps m # display the thread information in ps 
top -p pid1 [-p pid2 ...]  # To monitor one or more specific processes over time 
time # find out how much CPU time a command uses during its lifetime 

Most shells have a built-in time command that doesn’t provide exten- sive statistics, so you’ll probably need to run /usr/bin/time 
ps -l # command lists the current priority of a process 
uptime # tells you three load averages in addition to how long the kernel has been running 
The three bolded numbers are the load averages for the past 1 minute, 5 minutes, and 15 minutes 

vmstat 2 # reports statistics every 2 seconds 
The output falls into categories: procs for processes, memory for memory usage, swap for the pages pulled in and out of swap, io for disk usage, system for the number of times the kernel switches into kernel code, and cpu for the time used by different parts of the system. 

resource monitoring and performance analysis include the following: 
sar (System Activity Reporter) The sar package has many of the con- tinuous monitoring capabilities of vmstat, but it also records resource utilization over time. With sar, you can look back at a particular time to see what your system was doing. This is handy when you have a past system event that you want to analyze. 
acct (Process accounting) The acct package can record the processes and their resource utilization. 
Quotas You can limit many system resources on a per-process or per- user basis. See /etc/security/limits.conf for some of the CPU and memory options; there’s also a limits.conf(5) manual page. This is a PAM fea- ture, so processes are subject to this only if they’ve been started from something that uses PAM (such as a login shell). You can also limit the amount of disk space that a user can use with the quota system. 

network layers 
Application layer Contains the “language” that applications and servers use to communicate; usually a high-level protocol of some sort. 
Transport layer Defines the data transmission characteristics of the application layer. This layer includes data integrity checking, source and destination ports, and specifications for breaking application data into packets, Transmission Control Protocol (TCP) and User Datagram Protocol (UDP) are the most common transport layer protocols. 
Network or Internet layer Defines how to move packets from a source host to a destination host. The particular packet transit rule set for the Internet is known as Internet Protocol (IP). 
Physical layer Defines how to send raw data across a physical medium, such as Ethernet or a modem. This is sometimes called the link layer or host-to-network layer. 

Each Internet host has at least one numeric IP address in the form of a.b.c.d, such as 10.23.2.37. 

ifconfig # To see the addresses that are active on your Linux machine 
route -n # It uses a destination configuration called a routing table to determine its routing behavior. To show the routing table, 

There’s one tricky detail: Say the host wants to send something to 10.23.2.132, which matches both rules in the routing table, 0.0.0.0/0 and 10.23.2.0/24. How does the kernel know to use the second one? It chooses the longest destination prefix that matches. This is where CIDR network form comes in particularly handy: 10.23.2.0/24 matches, and its prefix is 24 bits long; 0.0.0.0/0 also matches, but its prefix is 0 bits long (that is, it has no prefix), so the rule for 10.23.2.0/24 takes priority. 

These tools use two protocols of particular interest: Internet Control Message Protocol (ICMP) 
The Domain Name Service (DNS) system, which maps names to IP addresses so that you don’t have to remember a bunch of numbers. 

ping # the most basic network debugging tools. 

ping 10.23.2.1PING 10.23.2.1 (10.23.2.1) 56(84) bytes of data.64 bytes from 10.23.2.1: icmp_req=1 ttl=64 time=1.76 ms 
64 bytes from 10.23.2.1: icmp_req=2 ttl=64 time=2.35 ms 
64 bytes from 10.23.2.1: icmp_req=4 ttl=64 time=1.69 ms 
64 bytes from 10.23.2.1: icmp_req=5 ttl=64 time=1.61 ms 

The most important parts of the output are the sequence number (icmp_req) and the round-trip time (time). 
A gap in the sequence numbers, such as the one between 2 and 4, usually means there’s some kind of connectivity problem. 
On a wired LAN, you should expect absolutely no packet loss and very low numbers for the round-trip time. 

traceroute host # see the path your packets take to a remote host. 

host www.example.com # To find the IP address behind a domain name 
You can also use host in reverse: Enter an IP address instead of a host- name to try to discover the hostname behind the IP address. But don’t expect this to work reliably. Many hostnames can represent a single IP address, and DNS doesn’t know how to determine which hostname should correspond to an IP address. 

The IEEE 802 family of standards documents defines many different kinds of Ethernet networks, from wired to wireless, but they all have a few things in common, in particular, the following: 
All devices on an Ethernet network have a Media Access Control (MAC) address, sometimes called a hardware address. Devices on an Ethernet network send messages in frames, which are wrappers around the data sent. 
eth0 (the first Ethernet card in the com- puter)
wlan0 (a wireless interface). 

ifconfig # viewing the network interface settings: 
ethtool # display or change the settings on Ethernet cards. 

ifconfig -a # displays a kernel network inter- face corresponding to the hardware 
ifconfig interface address netmask mask # To manually set the IP address and netmask for a kernel network interface 
interface is the name of the interface, such as eth0 

route add default gw gw-address # When the interface was up, you’d be ready to add routes, which was typically just a matter of setting the default gateway 
The gw-address parameter is the IP address of your default gateway; it must be an address in a locally connected subnet defined by the address and mask settings of one of your network interfaces. 

route del -net default # To remove a default gateway 

You can easily override the default gateway with other routes. For example, say your machine is on subnet 10.23.2.0/24, you want to reach a subnet at 192.168.45.0/24, and you know that 10.23.2.44 can act as a router for that subnet. Run this command to send traffic bound for 192.168.45.0 to that router: 
route add -net 192.168.45.0/24 gw 10.23.2.44
You don’t need to specify the router in order to delete a route: 
route del -net 192.168.45.0/24 

ifup eth0 # run the correct ifconfig and route commands for the eth0 interface 
Unfortunately, different distributions have completely different implementations of ifup and ifdown, and as a result, their configuration files are also completely different. 
Ubuntu, for example, uses the ifupdown suite with configuration files in /etc/network, 
and Fedora uses its own set of scripts with configuration in /etc/sysconfig/network-scripts. 

Most normal network client applications don’t particularly care what IP address your machine uses, as long as it works. Dynamic Host Configuration Protocol (DHCP, described in Section 9.16) tools do the basic network layer configuration on typical clients. 

There’s more to the story, though. For example, wireless networks add additional dimensions to interface configuration, such as network names, authentication, and encryption techniques. When you step back to look at the bigger picture, you see that your system needs a way to answer the fol- lowing questions: 
* If the machine has multiple physical network interfaces (such as a notebook with wired and wireless Ethernet), how do you choose which one(s) to use? 
* How should the machine set up the physical interface? For wireless net- works, this includes scanning for network names, choosing a name, and negotiating authentication. 
* Once the physical network interface is connected, how should the machine set up the software network layers, such as the Internet layer? 
* How can you let a user choose connectivity options? For example, how do you let a user choose a wireless network? 
* What should the machine do if it loses connectivity on a network interface? 

Answering these questions is usually more than simple boot scripts can handle, and it’s a real hassle to do it all by hand. The answer is to use a system service that can monitor physical networks and choose (and auto- matically configure) the kernel network interfaces based on a set of rules that makes sense to the user. The service should also be able to respondto requests from users, who should be able to change the wireless network they’re on without having to become root just to fiddle around with net- work settings every time something changes. 
The most widely used option on desktops and notebooks is NetworkManager. Other network configuration management systems are mainly targeted for smaller embedded systems, such as OpenWRT’s netifd, Android’s ConnectivityManager service, ConnMan, and Wicd. We’ll briefly discuss NetworkManager because it’s the one you’re most likely to encoun- ter. We won’t go into a tremendous amount of detail, though, because after you see the big picture, NetworkManager and other configuration systems will be more transparent. 

NetworkManager is a daemon that the system starts upon boot. Like all daemons, it does not depend on a running desktop component. Its job is to listen to events from the system and users and to change the network con- figuration based on a bunch of rules. 

nm-tool # very quick summary of your current connection status, 

nmcli # control NetworkManager from the command line 

/etc/hosts # On most systems, you can override hostname lookups 

/etc/resolv.conf # The traditional configuration file for DNS servers 

The two most popular transport protocols are the Transmission Control Protocol (TCP) and the User Datagram Protocol (UDP). 

When using TCP, an application opens a connection (not to be confused with NetworkManager connections) between one port on its own machine and a port on a remote host. For example, an application such as a web browser could open a connection between port 36406 on its own machine and port 80 on a remote host. From the application’s point of view, port 36406 is the local port and port 80 is the remote port. 

an example that shows TCP connections: The -n option disables hostname (DNS) resolution, and -t limits the output to TCP. 
netstat -nt
￼

The Local Address and Foreign Address fields show connections from your machine’s point of view, so the machine here has an interface configured at 10.23.2.4, and ports 47626, 41475, and 57132 on the local side are all con- nected. The first connection here shows port 47626 connected to port 5222 of 10.194.79.125. 

How do you know if a port is a well-known port? There’s no single way to tell, but one good place to start is to look in /etc/services, which translates well-known port numbers into names. 

TCP is popular as a transport layer protocol because it requires relatively little from the application side 

You can test dhclient by hand on the command line, but before doing so you must remove any default gateway route. To run the test, simply specify the network interface name (here, it’s eth0): 

dhclient eth0 

sysctl -w net.ipv4.ip_forward # IP forwarding in the router’s kernel 

When the router also has the third network interface with an Internet uplink, this same setup allows Internet access for all hosts on both subnets because they’re configured to use the router as the default gateway. But that’s where things get more complicated. The problem is that certain IP addresses such as 10.23.2.4 are not actually visible to the whole Internet; they’re on so-called private networks. To provide for Internet connectivity, you must set up a feature called Network Address Translation (NAT) on the router. 
￼

network address translation (iP masquerading) 
NAT is the most commonly used way to share a single IP address with a pri- vate network, and it’s nearly universal in home and small office networks. In Linux, the variant of NAT that most people use is known as IP masquerading. 

In order to set up a Linux machine to perform as a NAT router, you must activate all of the following inside the kernel configuration: network packet filtering (“firewall support”), connection tracking, IP tables support, full NAT, and MASQUERADE target support. Most distribution kernels come with this support. 
Next you need to run some complex-looking iptables commands to make the router perform NAT for its private subnet. Here’s an example that applies to an internal Ethernet network on eth1 sharing an external connec- tion at eth0 (you’ll learn more about the iptables syntax in Section 9.21): 

# sysctl -w net.ipv4.ip_forward# iptables -P FORWARD DROP# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE# iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT # iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT 
# iptables -L # viewing the current configuration 
# iptables -P FORWARD DROP # The DROP policy tells the kernel to dis- card the packet. To set the policy on a chain 
# iptables -A INPUT -s 192.168.34.63 -j DROP # Say that someone at 192.168.34.63 is annoying you. To prevent them from talking to your machine
iptables -L # To see the rule in place

your friend at 192.168.34.63 has told everyone on his subnet to open connections to your SMTP port (TCP port 25). To get rid of that traffic as well, run iptables -A INPUT -s 192.168.34.0/24 -p tcp --destination-port 25 -j DROP 

All is well until you hear from someone you know at 192.168.34.37 saying that they can’t send you email because you blocked their machine. Thinking that this is a quick fix, you run this command: iptables -A INPUT -s 192.168.34.37 -j ACCEPT 

The kernel reads the chain from top to bottom, using the first rule that matches. 
The first rule does not match 192.168.34.37, but the second does, because it applies to all hosts from 192.168.34.1 to 192.168.34.254 and this second rule says to drop packets. When a rule matches, the kernel carries out the action and looks no further down in the chain. (You might notice that 192.168.34.37 can send packets to any port on your machine except port 25 because the second rule only applies to port 25.) 
The solution is to move the third rule to the top. First, delete the third rule with this command: 
# iptables -D INPUT 3
Then insert that rule at the top of the chain with iptables -I: 
# iptables -I INPUT -s 192.168.34.37 -j ACCEPT
To insert a rule elsewhere in a chain, put the rule number after the 
chain name (for example, iptables -I INPUT 4 ...). 

You must allow only the packets that you trust and deny everything else. 
For example, say your machine has an SSH server on TCP port 22. There’s no reason for any random host to initiate a connection to any other port on your machine, and you shouldn’t give any such host a chance. To set that up, first set the INPUT chain policy to DROP: 
# iptables -P INPUT DROP 

To enable ICMP traffic (for ping and other utilities), use this line: 
# iptables -A INPUT -p icmp -j ACCEPT 

Make sure that you can receive packets you send to both your own net- work IP address and 127.0.0.1 (localhost). Assuming your host’s IP address is my_addr, do this: 
# iptables -A INPUT -s 127.0.0.1 -j ACCEPT 
# iptables -A INPUT -s my_addr -j ACCEPT 
If you control your entire subnet (and trust everything on it), you can replace my_addr with your subnet address and subnet mask, for example, 10.23.2.0/24. 

Now, although you still want to deny incoming TCP connections, you still need to make sure that your host can make TCP connections to the outside world. Because all TCP connections start with a SYN (connection request) packet, if you let all TCP packets through that aren’t SYN packets, you’re still okay: 
# iptables -A INPUT -p tcp '!' --syn -j ACCEPT 

Next, if you’re using remote UDP-based DNS, you must accept traffic from your name server so that your machine can look up names with DNS. Do this for all DNS servers in /etc/resolv.conf. Use this command (where the name server’s address is ns_addr): 
# iptables -A INPUT -p udp --source-port 53 -s ns_addr -j ACCEPT 
And finally, allow SSH connections from anywhere: 
# iptables -A INPUT -p tcp --destination-port 22 -j ACCEPT 

networking software includes an automatic system of looking up MAC addresses called Address Resolution Protocol (ARP). 

iw # You can view and change kernel space device and network configuration with a utility 
ex: iw dev wlan0 scan 
The network interface must be up for this command to work (if it’s not, run ifconfig wlan0 up), but you don’t need to configure any network layer parameters, such as an IP address. 

iw wlan0 connect network_name # Use iw to connect a network interface to an unsecured wireless network 

telnet is a program originally meant to enable logins to remote hosts. 
These are some other common network servers that you might find running on your system: 
httpd, apache, apache2 Web serverssshd Secure shell daemon (see Section 10.3)postfix, qmail, sendmail Mail serverscupsd Print servernfsd, mountd Network filesystem (file-sharing) daemonssmbd, nmbd Windows file-sharing daemons (see Chapter 12) rpcbind Remote procedure call (RPC) portmap service daemon 

To create SSH protocol version 2 keys, use the ssh-keygen pro- gram that comes with OpenSSH: 
# ssh-keygen -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key 
# ssh-keygen -t dsa -N '' -f /etc/ssh/ssh_host_dsa_key 

To start sshd at boot, use chkconfig like this 
chkconfig sshd on 

To log in to a remote host, run 
ssh remote_username@host 

You can also run pipelines to and from an ssh command as shown in the following example, which copies a directory dir to another host: 
$ tar zcvf - dir | ssh remote_host tar zxvf - 

You can use scp to transfer files to or from a remote machine to your machine or from one host to another. It works like the cp command. Here are a few examples: 
$ scp user@host:file .$ scp file user@host:dir$ scp user1@host1:file user2@host2:dir 

sftp # program works like the command-line ftp client, using get and put commands 

netstat 
￼
lsof -i # a complete list of programs using or listening to ports 

The lsof program is like netstat in that it tries to reverse-resolve every IP address that it finds into a hostname, which slows down the output. Use the -n option to disable name resolution: 
# lsof -n -iYou can also specify -P to disable /etc/services port name lookups. 

lsof -i:port # If you’re looking for a particular port 

lsof -iprotocol@host:port # full syntax 

lsof -iTCP:80 # if you only want to see connec- tions on TCP port 80 

netcat -l -p port_number # listen on a particular port 

Port Scanning 
nmap 10.1.2.2 # run a generic scan on a host 
Fortunately, you don’t need to know very much to keep your system safe. Here are a few basic rules of thumb: Run as few services as possible Block as much as possible with a firewall Track the services that you offer to the Internet If you run an SSH server, Postfix, or similar services, keep your software up-to-date and get appropriate security alerts. 
Use “long-term support” distribution releases for servers 
Don’t give an account on your system to anyone who doesn’t need one 
Avoid installing dubious binary packages 
Full compromise 
Denial-of-service (DoS) attack 
Malware 

The most common is a buffer over- flow exploit, where a careless programmer doesn’t check the bounds of 
a buffer array. 
A second attack to worry about is one that captures passwords sent across the wire as clear text. As soon as an attacker gets your password, it’s game over. 

You should always deactivate the following services 
ftpd 
telnetd, rlogind, rexecd 
fingerd

lsof -U # list of Unix domain sockets currently in use on your system 

Individual Arguments: $1, $2, ... first argument ($1) 
Number of Arguments: $# 
All Arguments: $@ 
it is very useful for passing them to a command inside the scrip 

If a line in your shell script gets too long for your text editor, you can split it up with a backslash (\). 

Script Name: $0 

Process ID: $$ 

Exit Code: $? 

When a Unix program finishes, it leaves an exit code for the parent process that started the program. The exit code is a number and is sometimes called an error code or exit value. When the exit code is zero (0), it typically 
means that the program ran without a problem. However, if the program has an error, it usually exits with a number other than 0 (but not always, as you’ll see next). 


#!/bin/shif [ "$1" = "hi" ]; then 
echo 'The first argument was "hi"' elif [ "$2" = "bye" ]; then 
echo 'The second argument was "bye"' else 
echo -n 'The first argument was not "hi" and the second was not "bye"-- ' 
echo They were '"'$1'"' and '"'$2'"' fi 

the following line checks whether file is a regular file (not a directory or spe- cial file): 
[ -f file ] 

the -a and -o flags are the logical “and” and “or” operators (for example, [ -f file1 -a file2 ]). 

File Tests 
-f Return true if a file is regular
-e Returns true if a file exists-s Returns true if a file is not empty 

File Type Operators 
-d Directory-h Symbolic link 
-b  Block device 
-c  Character device 
-p Named pipe 
-S Socket 

File Permissions Operators 
-r Readable
-w Writable
-x Executable
-u Setuid
-g Setgid
-k “Sticky”

-nt (newer than) 
[ file1 -nt file2 ] 
-ot (older than) 

two unary string operations: 
-z Returns true if its argument is empty ([ -z "" ] returns 0)-n Returns true if its argument is not empty ([ -n "" ] returns 1) 

Arithmetic Comparison Operators 

-eq Equal to
-ne Not equal to
-lt Less than
-gt Greater than
-le Less than or equal to
-ge Greater than or equal to 

#!/bin/sh
case $1 in
bye)echo Fine, bye. 
;; hi|hello) 
echo Nice to see you. 
;; what*) 
echo Whatever. 
;; *) 
echo 'Huh?' 
;; esac 

It’s sometimes necessary to create a temporary file to collect output for use by a later command. When making such a file, make sure that the filename is distinct enough that no other programs will accidentally write to it. 
Here’s how to use the mktemp command to create temporary filenames. This script shows you the device interrupts that have occurred in the last two seconds: 
#!/bin/shTMPFILE1=$(mktemp /tmp/im1.XXXXXX) TMPFILE2=$(mktemp /tmp/im2.XXXXXX) 
    cat /proc/interrupts > $TMPFILE1
    sleep 2
    cat /proc/interrupts > $TMPFILE2
    diff $TMPFILE1 $TMPFILE2
rm -f $TMPFILE1 $TMPFILE2 


Another problem with scripts that employ temporary files is that if the script is aborted, the temporary files could be left behind. In the preceding example, pressing ctRl-C before the second cat command leaves a temporary file in /tmp. Avoid this if possible. Instead, use the trap command to create a signal handler to catch the signal that ctRl-C generates and remove the tem- porary files, as in this handler: 

#!/bin/shTMPFILE1=$(mktemp /tmp/im1.XXXXXX) 
TMPFILE2=$(mktemp /tmp/im2.XXXXXX)trap "rm -f $TMPFILE1 $TMPFILE2; exit 1" INT 

$ basename example.html .html$ basename /usr/local/bin/example 
In both cases, basename returns example 

script to convert GIF image files to the PNG format: 
#!/bin/shfor file in *.gif; do 
    # exit if there are no files 
    if [ ! -f $file ]; then 
        exit 
    fi 
    b=$(basename $file .gif)    echo Converting $b.gif to $b.png... 
    giftopnm $b.gif | pnmtopng > $b.png 
done 

The sed program (sed stands for stream editor) is an automatic text editor that takes an input stream (a file or the standard input), alters it accord- ing to some expression, and prints the results to standard output. 
Use xargs to get around this problem by running a command on each file- name in its standard input stream. 

Many people use xargs with the find command. For example, the script below can help you verify that every file in the current directory tree that ends with .gif is actually a GIF (Graphic Interchange Format) image: 
$ find . -name '*.gif' -print | xargs file 
$ find . -name '*.gif' -print0 | xargs -0 file 

Here’s how to perform the preceding task using only find: 
$ find . -name '*.gif' -exec file {} \; 
The expr command is a clumsy, slow way of doing math. If you find yourself using it frequently, you should probably be using a language like Python instead of a shell script. 

rsync
On Linux, rsync is the standard synchronizer, offering good performance and many useful ways to perform transfers. 
To transfer entire directory hierarchies—complete with symbolic links, permissions, modes, and devices—use the -a option. Furthermore, if you want to copy to some place other than your home directory on the remote host, place this destination after the remote host, like this: 
$ rsync -a dir host:destination_dir 

Copying directories can be tricky, so if you’re not exactly sure what will happen when you transfer the files, use the -nv option combination. The-n option tells rsync to operate in “dry run” mode—that is, to run a trial without actually copying any files. The -v option is for verbose mode, which shows details about the transfer and the files involved: 
$ rsync -nva dir host:destination_dir 

Many users like the -z option in conjunction with -a to compress the data before transmission: 
rsync -az dir host:destination_dir 
across a fast local area network, the two end- point machines can be constrained by the CPU time that it takes to com- press and decompress data, so uncompressed transfer may be faster. 

rsync --bwlimit=10000 -a dir host:destination_dir # limit the bandwidth to 10,000 Kpbs 

rsync -a host:src_dir dest_dir # transfer files from a remote machine to your local host 

Samba # The standard file-sharing software suite for Unix 
NFS # The standard system for file sharing among Unix systems 

This simple prompt setting for bash ends with the customary $ (the tra- ditional csh prompt ends with %): 
PS1='\u\$ ' 
The \u is a substitution for the current username (see the PROMPTING section of the bash(1) manual page). Other popular substitutions include the following: 
\h The hostname (the short form, without domain names) \! The history number 
\w The current directory. Because this can become long, you can limit the display to just the final component with \W. 
\$ $ if running as a user account, # if root 

most popular Unix shells: bash and tcsh 

Desktop applications include certain common elements, such as buttons and menus, called widgets. To speed up development and provide a com- mon look, programmers use graphical toolkits to provide these elements. On operating systems such as Windows or Mac OS X, the vendor provides a common toolkit, and most programmers use that. On Linux, the GTK+ toolkit is one of the most common, but you’ll also frequently see widgets built on the Qt framework and others. 
Toolkits usually consist of shared libraries and support files such as images and theme information. 

GNOME, KDE, Unity, and Xfce are some com- mon Linux desktop environments. 

Listing Shared Library Dependencies ldd /bin/bashNever set LD_LIBRARY_PATH in shell startup files or when compiling soft- ware. When the dynamic runtime linker encounters this variable, it must often search through the entire contents of each specified directory more times than you’d care to know. This causes a big performance hit, but more importantly, you can get conflicts and mismatched libraries because the runtime linker looks in these directories for every program. 
If you must use LD_LIBRARY_PATH to run some crummy program for which you don’t have the source (or an application that you’d rather not compile, like Mozilla or some other beast), use a wrapper script. Let’s say your exe- cutable is /opt/crummy/bin/crummy.bin and needs some shared libraries in /opt/crummy/lib. Write a wrapper script called crummy that looks like this: #!/bin/sh LD_LIBRARY_PATH=/opt/crummy/lib export LD_LIBRARY_PATHexec /opt/crummy/bin/crummy.bin $@ 
Avoiding LD_LIBRARY_PATH prevents most shared library problems. But one other significant problem that occasionally comes up with developers is that a library’s application programming interface (API) may change slightly from one minor version to another, breaking installed software. The best solutions here are preventive: Either use a consistent methodology to install shared libraries with -Wl,-rpath to create a runtime link path or simply use the static versions of obscure libraries. 
make CC=clang 

clean:    rm -f $(OBJS) myprog 

MYPACKAGE_INCLUDES=-I/usr/local/include/mypackage 
MYPACKAGE_LIB=-L/usr/local/lib/mypackage -lmypackage 

PNG_INCLUDES=-I/usr/local/include
PNG_LIB=-L/usr/local/lib -lpng 

CFLAGS=$(CFLAGS) $(MYPACKAGE_INCLUDES) $(PNG_INCLUDES) 
LDFLAGS=$(LDFLAGS) $(MYPACKAGE_LIB) $(PNG_LIB) 

UTIL_OBJS=util.o 
BORING_OBJS=$(UTIL_OBJS) boring.o 
TRITE_OBJS=$(UTIL_OBJS) trite.o 
PROGS=boring trite 
all: $(PROGS)
boring: $(BORING_OBJS)    $(CC) -o $@ $(BORING_OBJS) $(LDFLAGS) 
trite: $(TRITE_OBJS)    $(CC) -o $@ $(TRITE_OBJS) $(LDFLAGS) 

gdb program # start gdb on an executable named program 
(gdb) run options # run program with the command-line  argument options 
(gdb) print variable # print the value of a particular vari- able that the trouble may be related to 
(gdb) break file:line_num # use the breakpoint feature file is a source code file, and line_num is the line number in that file where gdb should stop (gdb) continue # tell gdb to continue executing the program (gdb) clear file:line_num # clear a breakpoint 

http://www.ruby-lang.org/) 

Databases come in two basic forms: relational and non-relational. Relational databases (also called Relational Database Management Systems, or RDBMS), such as MySQL, PostgreSQL, Oracle, and MariaDB, are general-purpose databases that excel in tying different sets of data together. For example, say you have two sets of data, one with postal (ZIP) codes and names, and another with the postal codes and their corresponding states. A relational database would allow you to very quickly retrieve all of the names located in a particular state. You normally talk to relational databases using a pro- gramming language called SQL (Structured Query Language). 

Non-relational databases, sometimes known as NoSQL databases, tend to solve particular problems that relational databases don’t easily handle. For example, document-store databases, such as MongoDB, attempt to make storing and indexing entire documents easier. Key-value databases, such as redis, tend to focus on performance. NoSQL databases don’t have a com- mon query language like SQL for access. Instead, you’ll talk to them using a variety of interfaces and commands. 

Most larger database systems also involve significant networking because they’re distributed over many servers. The most common such net- work setup is called replication, 

The term cloud computing is a catch-all term that’s often used as label for this area. More specifically, infrastructure as a service (IaaS ) refers to systems that allow you to provision and control basic computing resources such as CPU, memory, storage, and networking on a remote server. The OpenStack project is one such API and platform that includes IaaS. 
Moving up past the raw infrastructure, you can also provision plat- form resources such as the operating system, database servers, and web servers. Systems that offer resources on this level are said to be platform as a service (PaaS). 
And once you have custom hardware, you must tailor the system’s software, such as the operating sys- tem internals and user interface. OpenWRT, mentioned in Chapter 9, is one such customized Linux distribution. 
command-line Editing 

ctrl-A Move the cursor to the beginning of the line 
ctrl-E Move the cursor to the end of the line 
ctrl-W Erase the preceding wordctrl-U Erase from cursor to beginning of line 
ctrl-K Erase from cursor to end of line 
ctrl-Y Paste erased text (for example, from ctrl-U) 
man -k keyword 


Ctrl + R + ${subname of command} #looking for ${subname of command} press again 


find . -iname ‘*’ —depth 1 exec mv ‘{}’ target_folder \;

Softlink 
ln -s file1 link1

git
restore unstaged file 
git clean -df *

# ssh-keygen
ssh-keygen [-q] [-b bits] [-C comment] [-f output_keyfile] [-m format]
            [-N new_passphrase] [-t dsa | ecdsa | ed25519 | rsa]
ssh-keygen -p [-f keyfile] [-m format] [-N new_passphrase]
            [-P old_passphrase]
ssh-keygen -i [-f input_keyfile] [-m key_format]
ssh-keygen -e [-f input_keyfile] [-m key_format]
ssh-keygen -y [-f input_keyfile]
ssh-keygen -c [-C comment] [-f keyfile] [-P passphrase]
ssh-keygen -l [-v] [-E fingerprint_hash] [-f input_keyfile]
ssh-keygen -B [-f input_keyfile]
ssh-keygen -D pkcs11
ssh-keygen -F hostname [-lv] [-f known_hosts_file]
ssh-keygen -H [-f known_hosts_file]
ssh-keygen -R hostname [-f known_hosts_file]
ssh-keygen -r hostname [-g] [-f input_keyfile]
ssh-keygen -G output_file [-v] [-b bits] [-M memory] [-S start_point]
ssh-keygen -f input_file -T output_file [-v] [-a rounds] [-J num_lines]
            [-j start_line] [-K checkpt] [-W generator]
ssh-keygen -I certificate_identity -s ca_key [-hU] [-D pkcs11_provider]
            [-n principals] [-O option] [-V validity_interval]
            [-z serial_number] file ...
ssh-keygen -L [-f input_keyfile]
ssh-keygen -A [-f prefix_path]
ssh-keygen -k -f krl_file [-u] [-s ca_public] [-z version_number]
            file ...
ssh-keygen -Q -f krl_file file ...
ssh-keygen -Y check-novalidate -n namespace -s signature_file
ssh-keygen -Y sign -f key_file -n namespace file ...
ssh-keygen -Y verify -f allowed_signers_file -I signer_identity
        -n namespace -s signature_file [-r revocation_file]
example:
ssh-keygen -b 2048 -t rsa


sed OPTIONS... [SCRIPT] [INPUTFILE...]
-b, --binary	Open input files in binary mode to consider lines to end at a line feed.
--debug	Switch to debug mode to print input in canonical form and annotate program execution.
--follow-symlinks	Edit the ultimate destination if the specified file is a symbolic link. It only works when combined with the -i option.
--help	Display the usage information.
--i, --in-place [=SUFFIX]	Perform edits in-place by overwriting the original file.
--posix	Disable all extensions to POSIX sed to simplify writing portable scripts.
--version	Display the version of sed running on the system.
-E, -r, --regexp-extended	Use extended regular expressions.
-e script, --expression=script	Add a specified script to run with the commands.
-f script-file	Add the contents of a specified script-file to run with the commands.
-l N, --line-length=N	Define the desired line-wrap length for the l command (default value is 70).
-n, --quiet, --silent	Disable output printing.
-s, --separate	View specified files as separate, not as a single continuous long stream.
--sandbox	Disable running external programs and operate only on input files on the command line.
-u, --unbuffered	Minimalize input and output buffer.
-z, --null-data, --zero-terminated	View input as a set of lines where each ends with a zero byte.

find . |grep "\._"


ncdu # ncdu stands for NCurses Disk Usage. It's a fast, terminal-based disk usage analyzer that provides a visual overview of disk space usage.
