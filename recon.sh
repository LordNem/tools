#!/bin/bash
printf "\33c"
red='\033[0;31m'
green='\033[0;32m'
white='\033[1;37m'
blue='\033[0;34m'
yellow='\033[1;33m'



if [ -z $2 ]; then

echo -e ${red} "[X]" ${white} "Usage: Enter Domain and output path"

        exit 1;

fi

mkdir $2
CWD="$(pwd)"
echo -e ${green} "[+]" ${white} "Loading DNSRecon" ${yellow}
cat << "EOF"

______ _   _  ___________                     
|  _  \ \ | |/  ___| ___ \                    
| | | |  \| |\ `--.| |_/ /___  ___ ___  _ __  
| | | | . ` | `--. \    // _ \/ __/ _ \| '_ \ 
| |/ /| |\  |/\__/ / |\ \  __/ (_| (_) | | | |
|___/ \_| \_/\____/\_| \_\___|\___\___/|_| |_|
             
EOF

cd /root/tools/dnsrecon
echo -e ${blue} "[-]" ${white} "A output will be found here " $2
./dnsrecon.py -n 8.8.8.8 --domain $1 -t axfr -x $2/$1


cd /root/tools/Domain-Mail-Check
echo  -e ${green} "[+]" ${white} "Checking for SPF and DMARC" ${yellow}
cat << "EOF"
  _____                   _____  __  __  _____ 
 |  __ \                 |  __ \|  \/  |/ ____|
 | |__) |   _ _ __ ______| |  | | \  / | |     
 |  _  / | | | '_ \______| |  | | |\/| | |     
 | | \ \ |_| | | | |     | |__| | |  | | |____ 
 |_|  \_\__,_|_| |_|     |_____/|_|  |_|\_____|
EOF
echo -e ${white} 
python Run-DMC -d $1

echo  -e ${blue} "[-]" ${white} "An XML output is also in the Domain-Mail-Check Folder"
echo  -e ${green} "[+]" ${white} "Complete"

