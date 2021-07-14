#!/bin/sh


if [ -z $1 ]; then
  echo "Required Parameter is empty!"
  exit 1
elif [ $1 == "linux" ]; then
  sm_url=$(wget -q -O - "http://www.sourcemod.net/downloads.php?branch=dev" | grep -oE -m1 "https://[a-z.]+/smdrop/[0-9.]+/sourcemod-(.*)-$1.tar.gz")
  wget -q $sm_url -O sourcemod.tar.gz
  tar -xzf sourcemod.tar.gz
  rm sourcemod.tar.gz
else
  sm_url=$(wget -q -O - "http://www.sourcemod.net/downloads.php?branch=dev" | grep -oE -m1 "https://[a-z.]+/smdrop/[0-9.]+/sourcemod-(.*)-$1.zip")
  wget -q $sm_url -O sourcemod.zip
  unzip sourcemod.zip
  rm sourcemod.zip
fi


mv addons/sourcemod/scripting ./
rm -r addons
rm -r cfg
rm -r extensions

echo $sm_url
