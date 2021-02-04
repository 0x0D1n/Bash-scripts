#!/bin/bash

if [ $# -eq 0 ]
then
	echo "[+] FORMAT ERROR: should be :  $0 <filename>"
	exit 1
fi

echo "[+] Shellcode: "
echo ""
for i in `objdump -d "$1" -M intel | tr "\t" " " | tr " " "\n" | egrep "^[0-9a-f]{2}$"`; do echo -n "\x$i"; done
echo "" #Empty echo's for formating
