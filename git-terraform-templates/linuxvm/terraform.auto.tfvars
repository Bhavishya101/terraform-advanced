/*
#=========Virtual Machine configuration====================
# Mark 'create_resource_group' as true if new resource group has to be created, else declare false to use existing RG.
create_resource_group = true
#Provide the existing resource group name if 'create_resource_group' is set as false.
#provide the new resource group name if 'create_resource_group' is set as true.
resource_group_name = "rg-go02-eas-n-terraform-test5580"
region              = "eastasia"
vm_name             = "GOAZENTFC012"
operatingsystem     = "Redhat7"
# set enable_accelerated_networking to true to activate accelerated networking, not all VM sizes support this feature.
enable_accelerated_networking = false
vm_size                       = "Standard_DS1_v2"
admin_username                = "adminuser" #password will be created in azvault
#if availability_zone is set as true, then create_availability_set must be set as false. Both options cannot be true at the same time.
availability_zone = false
zone              = 1 # provide the zone in which VM has to be deployed, pass this value only when availability_zone is set to true
# set below value to true if VM has to be deployed in availability set
create_availability_set = true
availabilityset-name    = "as-go02-eas-n-aiademo" # provide the name when create_availability_set is set to true.
systemidentity_required = true
datadisks_required      = true
datadisk_size_gb        = [32, 64]
Datadisk_type  = ["Standard_LRS", "Standard_LRS"]
osdisk_size_gb = 128
osdisk_type    = "Standard_LRS"

# Network configuration
vnet_name               = "vnet-go02-eas-p-nonprodsrv01"
vnet_resourcegroup_name = "rg-go02-eas-p-nonprodsrv01-network01"
subnet_name             = "subnet-d-nonprod-ts01-10.238.16.128-26"

# Virtual Machine auto shutdown configuration
enable_vm_auto_shutdown = true
recurrence_time         = 1900


#Enable backup on a Virtual Machine
backupvault_name     = "rsv-go02-eas-p-infrasvc01-backup01"
backuppolicy_name    = "rsv-go02-eas-p-infrasvc01-basic-general-policy"
backup_resourcegroup = "rg-go02-eas-p-infrasvc01-rsv01"


# Tagging
environment            = "non-prod"
project_name           = "AIA Terraform"
application_name       = "Linux VM"
ibm_imi_managed_env    = "non-production system"
business_unit          = "SG 01"
cost_center            = "WBS"
wbs_code               = "POC Infra provisiong"
server_owner           = "XYZ"
business_owner         = "ABC"
application_service    = "AS"
business_application   = "BS"
*/