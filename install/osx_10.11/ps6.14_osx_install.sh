#!/bin/bash

#brew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#.NET Core Install
brew update
brew install openssl
mkdir -p /usr/local/lib
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/

brew install wget

wget https://download.microsoft.com/download/1/4/1/141760B3-805B-4583-B17C-8C5BC5A876AB/Installers/dotnet-dev-osx-x64.1.0.0-preview2-1-003177.pkg
	
sudo installer -pkg dotnet-dev-osx-x64.1.0.0-preview2-1-003177.pkg -target /

#PowerShell Core 6.14
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell-6.0.0-alpha.14.pkg
sudo installer -pkg powershell-6.0.0-alpha.14.pkg -target /

#Azure RM NetCore Preview Module Install
powershell Install-Module AzureRM.NetCore.Preview
powershell Import-Module AzureRM.NetCore.Preview
if [[ $? -eq 0 ]]
    then
        echo "Successfully installed PowerShell Core with AzureRM NetCore Preview Module."
    else
        echo "PowerShell Core with AzureRM NetCore Preview Module did not install successfully." >&2
fi

#Install Azure CLI
#Address https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

read -p "Do you want to install Azure CLI? y/n" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    brew install npm 
    brew install node.js
    sudo npm install -g azure-cli
#    sudo ln -s /usr/bin/nodejs /usr/bin/node
    if [[ $? -eq 0 ]]
    then
        echo "Successfully installed Azure CLI"
    else
        echo "Azure CLI not installed successfully." >&2
fi
else 
    echo "You chose not to install Azure CLI. Exiting now."
fi

#non brew install
# wget http://aka.ms/mac-azure-cli

# sudo hdiutil attach azure-cli.0.10.5.dmg
# sudo installer -pkg /Volumes/azure-cli.0.10.5/azure-cli.0.10.5.dmg -target /