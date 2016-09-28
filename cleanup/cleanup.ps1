Param(
[string]$Resource
)

#Removes Resource Groups with positional parameters as specified above
Remove-AzureRmResourceGroup -Name $Resource -Verbose