#!/bin/sh

sm_url=$(wget -q -O - "http://www.sourcemod.net/downloads.php?branch=dev" | grep -oE -m1 "https://[a-z.]+/smdrop/[0-9.]+/sourcemod-(.*)-mac.zip")

wget -q $sm_url -O sourcemod.zip

unzip sourcemod.zip
rm sourcemod.zip

rm -r cfg
