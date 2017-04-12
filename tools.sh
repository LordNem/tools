#!/bin/bash
#Install Script

sudo apt-get update
sudo apt-get -y upgrade 

# Configure ToolSuite
cd ~/
cd Desktop
mkdir lib
cd lib

# Git Repos...

git clone https://github.com/LordNem/adXtract
git clone https://github.com/ins1gn1a/pwdlyser.git
git clone https://github.com/ins1gn1a/Domain-Mail-Check.git
git clone https://github.com/ins1gn1a/NetNTLM-Hashcat.git
git clone https://github.com/scelliott/CombineHarvester.git
git clone https://github.com/burtonc/HaveTheyBeenPwned.git
git clone https://github.com/drwetter/testssl.sh.git
git clone https://github.com/reverse-shell/routersploit.git
git clone https://github.com/libcrack/iker.git
git clone https://github.com/sensepost/mana
git clone https://github.com/Raikia/FiercePhish
git clone https://github.com/darkoperator/dnsrecon.git
git clone https://github.com/nccgroup/vlan-hopping---frogger.git

# Update Packages
git clone git://git.kali.org/packages/exploitdb.git
