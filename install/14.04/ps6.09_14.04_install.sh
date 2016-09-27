#!/bin/bash
#PS 6.09 Alpha Install

wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.9/powershell_6.0.0-alpha.9-1ubuntu1.14.04.1_amd64.deb
sudo apt-get install libunwind8 libicu52 -y
sudo dpkg -i powershell_6.0.0-alpha.9-1ubuntu1.14.04.1_amd64.deb

#Install Azure RM Modules
#Address to PS Gallery https://www.powershellgallery.com/packages/AzureRM.NetCore.Preview/0.3.4
	
Install-Package -Name AzureRM.NetCore.Preview -Source https://www.powershellgallery.com/api/v2 -ProviderName NuGet -ExcludeVersion -Destination ./.local/share/powershell/Modules/

Import-Module AzureRM.NetCore.Preview

#Install Azure CLI
#Address https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

sudo apt-get install node.js npm
npm install -g azure-cli