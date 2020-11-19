#!/bin/bash

echo "[+] Enter masscan result filename : "
read filename
#filename=masscan.txt

#Retrieve host
echo "[+] Retrieving host from masscan file"
host=$(head -n 1 $filename | cut -d " " -f6)

#Masscan output example
#Discovered open port 22/tcp on 10.10.10.48                                     
#Retrieve port number and store in file 
echo "[+] Creating file... portslist.txt for ports scanning with netcat"
cat $filename | cut -d " " -f4 | cut -d "/" -f1 > portslist.txt

echo "[+] Testing ports..."
while read port; do
    nc $host $port -n -v -c &
    #sleep 1
done < portslist.txt

