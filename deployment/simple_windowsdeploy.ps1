Param(
[string]$Location,
[string]$Resource,
[string]$Name
)

function Check-Session () {
    $Error.Clear()

    #if context already exist
    Get-AzureRmContext -ErrorAction Continue
    foreach ($eacherror in $Error) {
        if ($eacherror.Exception.ToString() -like "*Run Login-AzureRmAccount to login.*") {
            Add-AzureRMAccount
        }
    }

    $Error.Clear();
}

#check if session exists, if not then prompt for login
Check-Session

Write-Output "The Location you're putting your VM in is $Location."
Write-Output "The name of your resource group is $Resource."
Write-Output "The name of your deployment is $Name."

$TempFile="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-windows/azuredeploy.json"

New-AzureRmResourceGroup $Resource $Location

New-AzureRmResourceGroupDeployment -Name $Name -ResourceGroupName $Resource -TemplateUri $TempFile 



