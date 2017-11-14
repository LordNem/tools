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

CWD="$(pwd)"
echo -e ${green} "[+]" ${white} "Loading CombineHarvester" ${yellow}
cat << "EOF"
   _____                _     _            _    _                           _            
  / ____|              | |   (_)          | |  | |                         | |           
 | |     ___  _ __ ___ | |__  _ _ __   ___| |__| | __ _ _ ____   _____  ___| |_ ___ _ __ 
 | |    / _ \| '_ ` _ \| '_ \| | '_ \ / _ \  __  |/ _` | '__\ \ / / _ \/ __| __/ _ \ '__|
 | |___| (_) | | | | | | |_) | | | | |  __/ |  | | (_| | |   \ V /  __/\__ \ ||  __/ |   
  \_____\___/|_| |_| |_|_.__/|_|_| |_|\___|_|  |_|\__,_|_|    \_/ \___||___/\__\___|_|   
EOF

cd /root/tools/CombineHarvester
./combineharvester.sh "$1" "$2"

cd ..
cd /root/tools/HaveTheyBeenPwned

echo -e ${green} "[+]" ${white} "Extracting Email Addresses for HIBP" ${yellow}
cat $2/humans.csv  | cut -d , -f 1,3 |cut -d , -f 2|sort -u |grep -v "found@" > $2/Emails.txt
cat << "EOF"
  _    _ _____ ____  _____     _____ _               _    
 | |  | |_   _|  _ \|  __ \   / ____| |             | |   
 | |__| | | | | |_) | |__) | | |    | |__   ___  ___| | __
 |  __  | | | |  _ <|  ___/  | |    | '_ \ / _ \/ __| |/ /
 | |  | |_| |_| |_) | |      | |____| | | |  __/ (__|   < 
 |_|  |_|_____|____/|_|       \_____|_| |_|\___|\___|_|\_\
EOF
echo -e ${blue} "[-]" ${white} "A Complete list of email addresses that were found is here" $2
./HaveTheyBeenPwned.py -i $2/Emails.txt -oR $2/OwnedEmailAddress.txt
cd ..

cd /root/tools/dnsrecon
echo -e ${blue} "[-]" ${white} "A output will be found here /root/tools/dnsrecon" 
./dnsrecon.py -n 8.8.8.8 --domain $1 -t axfr -x $1


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
