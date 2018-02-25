#!/bin/bash
cd /etc/ssh/
mkdir /etc/ssh/insecure_original_default_kali_keys 
mv ssh_host_* /etc/ssh/insecure_original_default_kali_keys/ 
dpkg-reconfigure openssh-server
update-rc.d -f ssh enable 2 3 4 5
