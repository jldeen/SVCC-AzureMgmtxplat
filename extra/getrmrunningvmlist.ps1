#Windows PS Only

#Add Azure RM Account
Add-AzureRmAccount

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