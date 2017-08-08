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

wget https://download.microsoft.com/download/B/9/F/B9F1AF57-C14A-4670-9973-CDF47209B5BF/dotnet-dev-osx-x64.1.0.4.pkg
	
sudo installer -pkg dotnet-dev-osx-x64.1.0.4.pkg -target /

#PowerShell Core 6.14
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-beta.4/powershell-6.0.0-beta.4-osx.10.12-x64.pkg
sudo installer -pkg powershell-6.0.0-beta.4-osx.10.12-x64.pkg -target /

#Azure RM NetCore Preview Module Install
sudo powershell -Command {Install-Module -Name AzureRM.Netcore}
sudo powershell -Command {Import-Module -Name AzureRM.Netcore}

if [[ $? -eq 0 ]]
    then
        echo "Successfully installed PowerShell Core with AzureRM NetCore Preview Module."
    else
        echo "PowerShell Core with AzureRM NetCore Preview Module did not install successfully." >&2
fi

#Install Azure CLI 2.0
#Address https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
#Github https://github.com/Azure/azure-cli/releases

read -p "Do you want to install Azure CLI? y/n" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl -L https://aka.ms/InstallAzureCli | bash
    exec -l $SHELL
    if [[ $? -eq 0 ]]
    then
        echo "Successfully installed Azure CLI 2.0"
    else
        echo "Azure CLI 2.0 not installed successfully" >&2
fi
else 
    echo "You chose not to install Azure CLI 2.0... Exiting now."
fi