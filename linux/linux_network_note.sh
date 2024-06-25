# check if there is network connection to $ip/$hostname
ping $ip/$hostname

# ip address, protocol (IP or IPv6) address on a device
ip add

# ip route, routing table management
ip route

# dns look up tool
dig
nslookup
host

# dns server dictionary
/etc/hosts

# GNU Name Service Switch functionality
/etc/nsswitch.config

# 
/etc/resolv.conf

# private ip range
RFC 1918 name	IP address range	Largest CIDR block (subnet mask)
24-bit block	10.0.0.0 – 10.255.255.255	10.0.0.0/8 (255.0.0.0)
20-bit block	172.16.0.0 – 172.31.255.255	172.16.0.0/12 (255.240.0.0)
16-bit block	192.168.0.0 – 192.168.255.255	192.168.0.0/16 (255.255.0.0)
