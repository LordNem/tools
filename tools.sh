#!/bin/bash
red='\033[0;31m'
green='\033[0;32m'
white='\033[1;37m'
blue='\033[0;34m'
yellow='\033[1;33m'


#git hub repos
Git_Clone(){
echo -e ${green} "[+]" ${white} "Downloading" ${red} "adXtract" ${white}
	git clone https://github.com/LordNem/adXtract &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "Run-DMC" ${white}
	git clone https://github.com/ins1gn1a/Domain-Mail-Check.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "NetNTLM-Hashcat" ${white}
	git clone https://github.com/ins1gn1a/NetNTLM-Hashcat.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "CombineHarvester" ${white}
	git clone https://github.com/LordNem/CombineHarvester.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "wifiPwn" ${white}
	git clone https://github.com/LordNem/wifiPwn.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "HaveTheyBeenPwned" ${white}
	git clone https://github.com/burtonc/HaveTheyBeenPwned.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "testssl" ${white}
	git clone https://github.com/drwetter/testssl.sh.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "routersploit" ${white}
	git clone https://github.com/reverse-shell/routersploit.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "iker" ${white}
	git clone https://github.com/libcrack/iker.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "Mana" ${white}
	git clone https://github.com/sensepost/mana &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "FiercePhish" ${white}
	git clone https://github.com/Raikia/FiercePhish &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "dnsrecon" ${white}
	git clone https://github.com/darkoperator/dnsrecon.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "Frogger" ${white}
	git clone https://github.com/nccgroup/vlan-hopping---frogger.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "CMSMap" ${white}
	git clone https://github.com/Dionach/CMSmap.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "bettercap" ${white}
	git clone https://github.com/evilsocket/bettercap.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "SecLists" ${white}
	git clone https://github.com/danielmiessler/SecLists.git &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "Bloodhound" ${white}
	git clone https://github.com/BloodHoundAD/BloodHound.git &> /dev/null	
echo -e ${green} "[+]" ${white} "Downloading" ${red} "Empire" ${white}
	git clone https://github.com/byt3bl33d3r/Empire &> /dev/null
echo -e ${green} "[+]" ${white} "Downloading" ${red} "DeathStar" ${white}	
	git clone https://github.com/byt3bl33d3r/DeathStar.git
echo -e ${green} "[+]" ${white} "Installing" ${red} "sshfs" ${white}
	apt-get install sshfs -y &> /dev/null
echo -e ${green} "[+]" ${white} "Installing" ${red} "Empire" ${white}
	cd Empire/setup && ./install.sh && cd .. &> /dev/null
echo -e ${green} "[+]" ${white} "Installing" ${red} "DeathStar" ${white}
	cd DeathStar
	pip3 install -r requirements.txt && cd ..&> /dev/null
echo -e ${green} "[+]" ${white} "Installing" ${red} "Responder" ${white}
	git clone https://github.com/lgandx/Responder.git &> /dev/null
echo -e ${green} "[+]" ${white} "Installing" ${red} "Impacket" ${white}
	git clone https://github.com/CoreSecurity/impacket.git &> /dev/null	
	
	
# Update Packages
#git clone git://git.kali.org/packages/exploitdb.git
}

#Set Target Location
printf "\033c"
set_target (){
echo -e ${green} "[+]" ${yellow} "Enter the where you would like the tools Placed" ${red}
echo -e ${green} "[+]" ${yellow} "Recommended Place is "${white} "/root/tools/" ${red}
read -e  tools
mkdir $tools
cd $tools
Git_Clone
}

#Install Script
printf "\033c"
echo -e ${blue} 
cat << "EOF"
 _____           _     
|_   _|         | |    
  | | ___   ___ | |___ 
  | |/ _ \ / _ \| / __|
  | | (_) | (_) | \__ \
  \_/\___/ \___/|_|___/
EOF

echo -e ${green} "[+]" ${white} "Do you want to Update && Upgrade <Y/n> " ${red}
read prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]
then
echo -e ${green} "[+]" ${white} "Performing updates Silently Please wait..."
 sudo apt-get update &> /dev/null && apt-get -y upgrade
set_target
else
set_target
fi
