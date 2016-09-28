#Add Azure Account to current PS Session
Add-AzureRmAccount

#Get list of all resource groups, location, and provisioning state
Get-AzureRmResourceGroup | Select-Object ResourceGroupName, Location, ProvisioningState\


