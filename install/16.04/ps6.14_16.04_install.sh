#!/bin/bash

#.NET Core Install
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update

sudo apt-get install dotnet-dev-1.0.0-preview2.1-003177 -y


#PowerShell Core 6.14
wget https://github.com/PowerShell/PowerShell/releases/download/v6.0.0-alpha.14/powershell_6.0.0-alpha.14-1ubuntu1.16.04.1_amd64.deb
sudo dpkg -i powershell_6.0.0-alpha.14-1ubuntu1.16.04.1_amd64.deb
sudo apt-get install -f -y

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
    sudo apt-get install node.js npm -y
    sudo npm install -g azure-cli
    sudo ln -s /usr/bin/nodejs /usr/bin/node
    if [[ $? -eq 0 ]]
    then
        echo "Successfully installed Azure CLI."
    else
        echo "Azure CLI not installed successfully." >&2
fi
else 
    echo "You chose not to install Azure CLI. Exiting now."
fi

