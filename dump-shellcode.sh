#!/bin/bash

echo "[+] Enter binary file name to create shellcode {format:\x00} [+]"
read filename
echo "[+] Shellcode: "
echo ""
for i in `objdump -d $filename -M intel | tr "\t" " " | tr " " "\n" | egrep "^[0-9a-f]{2}$"`; do echo -n "\x$i"; done
