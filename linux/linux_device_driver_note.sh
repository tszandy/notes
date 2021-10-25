#insert kernel space 
insmod ./ex01_simple_module.ko

#list kernel module
lsmod

#remove kernel module 
rmmod

# auto add kernel module
modprobe $module_name

# update module dependency 
depmod
