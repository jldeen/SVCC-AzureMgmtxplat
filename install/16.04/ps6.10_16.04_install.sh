#!/bin/bash
#PS 6.10 Install

#.NET Core Install
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
sudo apt-get update

sudo apt-get install dotnet-dev-1.0.0-preview2-003131 -y

#PowerShell Core 6.10
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.10/powershell_6.0.0-alpha.10-1ubuntu1.16.04.1_amd64.deb
sudo dpkg -i powershell_6.0.0-alpha.10-1ubuntu1.16.04.1_amd64.deb
sudo apt-get install -f -y

#Azure RM NetCore Preview Module Install
powershell ../../AzureRMNetCorePreview.ps1

#Install Azure CLI
#Address https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

sudo apt-get install node.js npm -y
sudo npm install -g azure-cli