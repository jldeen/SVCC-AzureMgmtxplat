#Add Azure Account to current PS Session
Add-AzureRmAccount

#Get list of all resource groups, location, and provisioning state
Get-AzureRmResourceGroup | Select-Object ResourceGroupName, Location, ProvisioningState
 
Get-AzureRMVM | select-object Name, ResourceGroupName
   
#Virtual Machine Status in ARM
$RGs = Get-AzureRMResourceGroup
foreach($RG in $RGs)
{
    $VMs = Get-AzureRmVM -ResourceGroupName $RG.ResourceGroupName
    foreach($VM in $VMs)
    {
        $VMDetail = Get-AzureRmVM -ResourceGroupName $RG.ResourceGroupName -Name $VM.Name -Status
        foreach ($VMStatus in $VMDetail.Statuses)
        { 
            if($VMStatus.Code -like "PowerState/*")
            {
                $VMStatusDetail = $VMStatus.DisplayStatus
            }
        }
        #region
        $out = new-object psobject
        $out | add-member noteproperty 'Virtual Machine Name' $VM.Name
        $out | add-member noteproperty Status $VMStatusDetail
        $out | add-member noteproperty 'Resource Group Name' $RG.ResourceGroupName
        Write-Output $out
        #endregion
    }
}

Get-AzureRmVM | Select-Object
 
AvailabilitySetReference 
BootDiagnostics 
DataDiskNames
DiagnosticsProfile
Disks
Extensions
HardwareProfile
Id
InstanceView
LicenseType 
Location
Name
NetworkInterfaceIDs 
NetworkProfile 
OSProfile
Plan
PlatformFaultDomain
PlatformUpdateDomain
ProvisioningState
RemoteDesktopThumbprint
RequestId
ResourceGroupName
StatusCode
Statuses
StorageProfile
Tags
Type
VMAgent               
