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

cd /root/Desktop/lib/scripts/CombineHarvester
./combineharvester.sh "$1" "$2"

cd ..
cd /root/Desktop/lib/HaveTheyBeenPwned

echo -e ${green} "[+]" ${white} "Checking for Addresses against HIBP" ${yellow}
cat << "EOF"
  _    _ _____ ____  _____     _____ _               _    
 | |  | |_   _|  _ \|  __ \   / ____| |             | |   
 | |__| | | | | |_) | |__) | | |    | |__   ___  ___| | __
 |  __  | | | |  _ <|  ___/  | |    | '_ \ / _ \/ __| |/ /
 | |  | |_| |_| |_) | |      | |____| | | |  __/ (__|   < 
 |_|  |_|_____|____/|_|       \_____|_| |_|\___|\___|_|\_\
EOF
echo -e ${blue} "[-]" ${white} "A Complete list of email addresses that were found is here" $2
./HaveTheyBeenPwned.py -i $2/human-emails -o $2/OwnedEmailAddress.txt
cd ..
cd /root/Desktop/lib/Domain-Mail-Check
echo  -e ${blue} "[+]" ${white} "Checking for SPF and DMARC" ${yellow}
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

echo  -e ${green} "[+]" ${white} "Check $2/human-emails.txt for a Complete list of Email Addresses found"
echo  -e ${green} "[+]" ${white} "Complete"
