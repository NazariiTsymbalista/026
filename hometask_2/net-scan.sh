#!/bin/bash
   #Write a script called 'net-scan.sh' which will check for open ports TCP/80 and TCP/443 in a specified IP-address range ({0..255}) 
   #and print report only with available hosts and ports. You should use only the native Linux tool. Do not install any software such as nmap.
   # Example of run: net-scan.sh 192.168.1.{0..255}
for IP in 192.168.1.{0..255}; do
 timeout 0.5s nc -z -v $IP 80 2>&1 |grep succeeded
 timeout 0.5s nc -z -v $IP 443 2>&1 |grep succeeded # construction  nc -z -v $IP 80 443  not working properly  
done
