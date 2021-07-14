import sys
import os
import subprocess
import re
import tarfile
import zipfile

home_dir = os.path.dirname(__file__)

if os.getcwd() is not home_dir:
    os.chdir(home_dir)

if len(sys.argv) < 3:
    print("Too little arguments.")
    sys.exit(1)

system = sys.argv[1]

username = sys.argv[2]

if system == "linux":
    subprocess.call('cmd /c wget -q -O - "http://www.sourcemod.net/downloads.php?branch=dev" | grep -oE -m1 "https://[a-z.]+/smdrop/[0-9.]+/sourcemod-(.*)-linux.tar.gz" > link.txt')
else:
    subprocess.call(f'cmd /c wget -q -O - "http://www.sourcemod.net/downloads.php?branch=dev" | grep -oE -m1 "https://[a-z.]+/smdrop/[0-9.]+/sourcemod-(.*)-{system}.zip" > link.txt')

file = open("link.txt","r")

sm_url = file.readlines()[0]

file.close()

os.remove("link.txt")

sm_url = re.sub(r"\s+", "", sm_url, flags=re.UNICODE)

if sm_url.endswith(".tar.gz"):
    subprocess.call(f'curl -k -L {sm_url} -o sourcemod.tar.gz', shell=True)
    with tarfile.open('sourcemod.tar.gz','r') as tar_ref:
        tar_ref.extractall(os.getcwd())
        tar_ref.close()
    os.remove('sourcemod.tar.gz')
elif sm_url.endswith(".zip"):
    subprocess.call(f'curl -k -L {sm_url} -o sourcemod.zip', shell=True)
    with zipfile.ZipFile('sourcemod.zip', 'r') as zip_ref:
        zip_ref.extractall(os.getcwd())
        zip_ref.close()
    os.remove('sourcemod.zip')

subprocess.call(f'docker build -t {username}/spcomp:{system} .')