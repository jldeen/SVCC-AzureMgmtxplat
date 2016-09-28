azure config mode arm
azure login
azure account list

#-----fill in these variables
 
$rgName = "LVMTest"
 
$template = "Template1.json" # local file path specified
 
$vmName = ”LVMTest”
 
$vhdName = "CoolVHDTest"
 
#-----stop the vm
azure vm deallocate -g $rgName -n $vmName
 
#-----generalize the image
azure vm generalize $rgName -n $vmName
 
#-----capture the image
azure vm capture $rgName $vmName $vhdName -t $template