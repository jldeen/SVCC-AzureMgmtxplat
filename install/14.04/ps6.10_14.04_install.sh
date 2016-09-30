#!/bin/bash
#PS 6.10 Install

#PowerShell Core 6.10
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.10/powershell_6.0.0-alpha.10-1ubuntu1.14.04.1_amd64.deb
sudo dpkg -i powershell_6.0.0-alpha.10-1ubuntu1.14.04.1_amd64.deb
sudo apt-get install -f -y

#Azure RM NetCore Preview Module Install
powershell ../../AzureRMNetCorePreview.ps1
powershell Import-Module AzureRM.NetCore.Preview

#Install Azure CLI
#Address https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

sudo apt-get install node.js npm -y
sudo npm install -g azure-cli
sudo ln -s /usr/bin/nodejs /usr/bin/node