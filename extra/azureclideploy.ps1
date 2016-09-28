azure config mode arm
azure login
azure account list
# ---- Existing Resources ----
 
$rgName = "LVMTest"
 
$vNet = "LVMTest"
 
$subnet = "Default"
 
$location = "westus"
 
# ---- New Network Resources ----
 
$pip = "CoolVHDTest"
 
$nic = "LVMNic2"
 
# ---- Network Creation ---- 
azure network public-ip create $rgName $pip -l $location
azure network nic create $rgName $nic -k $subnet -m $vNet -p $pip -l $location
 
# --- Run the command below to grab the ID of the new Nic. Copy it somewhere safe&nbsp;
azure network nic show $rgName $nic
 
# ---- Deployment ---- 
$deployName = "LVMDemo"
$template = "C:\Templates\Template1.json" # local file path specified
azure group deployment create $rgName $deployName -f $template