#!/bin/bash

#brew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#.NET Core Install
brew update
brew install openssl
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/

brew install wget

wget https://download.microsoft.com/download/0/A/3/0A372822-205D-4A86-BFA7-084D2CBE9EDF/dotnet-dev-osx-x64.1.0.0-preview2-003131.pkg
	
sudo installer -pkg dotnet-dev-osx-x64.1.0.0-preview2-003131 -target /

#PowerShell Core 6.10
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.10/powershell-6.0.0-alpha.10.pkg
sudo installer -pkg powershell-6.0.0-alpha.10.pkg -target /


#Azure RM NetCore Preview Module Install
powershell ../../AzureRMNetCorePreview.ps1
powershell Import-Module AzureRM.NetCore.Preview

#Install Azure CLI
#Address https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

brew install npm 
brew install node.js
sudo npm install -g azure-cli
sudo ln -s /usr/bin/nodejs /usr/bin/node

#non brew install
# wget http://aka.ms/mac-azure-cli

# sudo hdiutil attach azure-cli.0.10.5.dmg
# sudo installer -pkg /Volumes/azure-cli.0.10.5/azure-cli.0.10.5.dmg -target /