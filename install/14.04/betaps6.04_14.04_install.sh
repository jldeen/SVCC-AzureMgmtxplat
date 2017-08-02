#!/bin/bash

# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register the Microsoft Ubuntu repository
curl https://packages.microsoft.com/config/ubuntu/14.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

# Update apt-get
sudo apt-get update

# Install PowerShell
sudo apt-get install -y powershell

#Azure RM NetCore Preview Module Install
sudo powershell Install-Module -Name AzureRM.Netcore
sudo powershell Import-Module AzureRM.Netcore

if [[ $? -eq 0 ]]
    then
        echo "Successfully installed PowerShell Core with AzureRM NetCore Module."
    else
        echo "PowerShell Core with AzureRM NetCore Module did not install successfully." >&2
fi

#Install Azure CLI 2.0
#Address https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
#Github https://github.com/Azure/azure-cli/releases

read -p "Do you want to install Azure CLI? y/n" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
     sudo tee /etc/apt/sources.list.d/azure-cli.list
    sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 417A0893
    sudo apt-get install apt-transport-https
    sudo apt-get update && sudo apt-get install azure-cli
    if [[ $? -eq 0 ]]
    then
        echo "Successfully installed Azure CLI 2.0"
    else
        echo "Azure CLI 2.0 not installed successfully" >&2
fi
else 
    echo "You chose not to install Azure CLI 2.0... Exiting now."
fi