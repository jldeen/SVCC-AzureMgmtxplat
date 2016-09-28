#!/bin/bash
#PS 6.09 Alpha Install

wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.9/powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb
sudo apt-get install libunwind8 libicu55 -y
sudo dpkg -i powershell_6.0.0-alpha.9-1ubuntu1.16.04.1_amd64.deb

#Azure RM NetCore Preview Module Install
powershell ../../AzureRMNetCorePreview.ps1

#Install Azure CLI
#Address https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

sudo apt-get install node.js npm -y
sudo npm install -g azure-cli