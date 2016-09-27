#!/bin/bash
#PS 6.10 Install

#PowerShell Core 6.10
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.10/powershell_6.0.0-alpha.10-1ubuntu1.14.04.1_amd64.deb
sudo dpkg -i powershell_6.0.0-alpha.10-1ubuntu1.14.04.1_amd64.deb
sudo apt-get install -f -y