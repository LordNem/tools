#!/bin/bash
sudo apt install xrdp
sudo apt remove gnome-core
sudo apt install lxde-core lxde kali-defaults kali-root-login desktop-base
sudo update-rc.d -f xrdp enable 2 3 4
sudo update-rc.d -f xrdp-sesman enable 2 3 4 5
sudo service xrdp start
sudo service xrdp-sesman start
sudo update-alternatives --config x-session-manager
sudo usr/bin/startlxde
sudo reboot
