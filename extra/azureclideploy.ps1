Param(
[string]$Location,
[string]$Resource,
[string]$Name
)

azure config mode arm

#azure account list

Write-Output "The Location you're putting your VM in is $Location."
Write-Output "The name of your resource group is $Resource."
Write-Output "The name of your deployment is $Name."

$template="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-linux/azuredeploy.json"

azure group create -n $resource -l $location
azure group deployment create -f $template -g $resource $deploymentName