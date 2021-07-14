#!/bin/sh

sm_url=$(wget -q -O - "http://www.sourcemod.net/downloads.php?branch=dev" | grep -oE -m1 "https://[a-z.]+/smdrop/[0-9.]+/sourcemod-(.*)-linux.tar.gz")

wget -q $sm_url -O sourcemod.tar.gz

tar -xzf sourcemod.tar.gz
rm sourcemod.tar.gz

rm -r cfg
