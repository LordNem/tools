#!/bin/bash
printf "\33c"
if [ -z $2 ]; then

        echo 'Enter Domain and Output Location';

        exit 1;

fi
green='\033[0;32m'
white='\033[1;37m'
CWD="$(pwd)"
cd /root/Desktop/lib/CombineHarvester
./combineharvester.sh "$1" "$2"

cd ..
cd /root/Desktop/lib/HaveTheyBeenPwned

echo -e ${green} "[+]" ${white} "Checking for Addresses against HIBP"
./HaveTheyBeenPwned.py -i $2/human-emails -o $2/OwnedEmailAddress.txt
cd ..
cd /root/Desktop/lib/Domain-Mail-Check
echo  -e ${green} "[+]" ${white} "Checking for SPF and DMARC"
python Run-DMC -d $1

echo  -e ${green} "[+]" ${white} "Check $2/human-emails.txt for a Complete list of Email Addresses found"
echo  -e ${green} "[+]" ${white} "Complete"
