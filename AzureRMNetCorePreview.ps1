#AzureRM.NetCore.Preview

#Install Azure RM Modules
#Address to PS Gallery https://www.powershellgallery.com/packages/AzureRM.NetCore.Preview/0.3.4

Install-Package -Name AzureRM.NetCore.Preview -Source https://www.powershellgallery.com/api/v2 -ProviderName NuGet -ExcludeVersion -Destination ~/.local/share/powershell/Modules/

Import-Module AzureRM.NetCore.Preview

exit