#basic scan target ip, 
nmap -sn <target IP address>

#nmap normal scan, get a list of open ports
nmap --reason <target IP address>

#nmap protocol scan
nmap -sO <target IP address>

#nmap firewall probe, check if the scan are getting filtered
nmap -sA <target IP address>

#nmap quick tcp scan 
nmap -T4 -F <target IP address>

#nmap service enumeration, associate service with port.
nmap -sV <target IP address>

#nmap UDP port scan 
nmap -sU -p 1-1024 <target IP address>

#nmap detect operation system version
nmap -O <target IP address>

#nmap intense scan, do tcp port scan ,enumerate services.
nmap -T4 -A -v <target IP address>
