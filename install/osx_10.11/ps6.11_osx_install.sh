#!/bin/bash

[[ `id -u` -eq 0 ]] || { echo "Must be root to run this script, try running again with sudo"; exit 1; }

#brew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#.NET Core Install
brew update
brew install openssl
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/

brew install wget

wget https://download.microsoft.com/download/1/0/C/10C868F3-EF61-47A7-95CF-FF2AE042D65F/dotnet-dev-osx-x64.1.0.0-preview2-003148.pkg
	
sudo installer -pkg dotnet-dev-osx-x64.1.0.0-preview2-003148.pkg -target /

#PowerShell Core 6.10
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.11/powershell-6.0.0-alpha.11.pkg
sudo installer -pkg powershell-6.0.0-alpha.11.pkg -target /


#Azure RM NetCore Preview Module Install
powershell Install-Module AzureRM.NetCore.Preview
powershell Import-Module AzureRM.NetCore.Preview

#Install Azure CLI
#Address https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

read -p "Do you want to install Azure CLI? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install npm 
    brew install node.js
    sudo npm install -g azure-cli
    sudo ln -s /usr/bin/nodejs /usr/bin/node
fi
if [ $? -eq 0 ]
then
  echo "Successfully installed Azure CLI"
else
  echo "Azure CLI not installed successfully." >&2
fi


#non brew install
# wget http://aka.ms/mac-azure-cli

# sudo hdiutil attach azure-cli.0.10.5.dmg
# sudo installer -pkg /Volumes/azure-cli.0.10.5/azure-cli.0.10.5.dmg -target /