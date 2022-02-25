****************************
# AZURE Linux Virtual Machine
****************************

This Terraform code is developed to automate the creation of the Azure Virtual Machine in accordance to AIA requirements. These are ofcourse bound by the rules, parameters,limitations, etc set by Azure. For more details please refer to : 
https://docs.microsoft.com/en-us/azure/virtual-machines/
https://azure.microsoft.com/en-us/services/virtual-machines/linux/


## Virtual Machine input Variables:

- `create_resource_group`= Mark "create_resource_group" as true if new resource group has to be created, else declare false to use existing RG
Provide the existing resource group name if "create_resource_group" is set as false.
provide the new resource group name if 'create_resource_group' is set as true.
- `resource_group_name` = resource group name in which VM has to be deployed.
- `availability_zone` = Mark this as false, if VM is not going to be deployed in an availability zone. EastAsia does not support availability zone.
- `zone` = provide zone number, if availability_zone is marked as true, else null.
- `create_availability_set` = Mark this as True, if VM has to be deployed in Availability set. if true, new availbility set will be created based on "availabilityset-name" input.
- `availabilityset_name` = provide the availability set name, if create_availability_set as true. else null. 
- `datadisks_required` = Mark this varaible as true, if VM has to deployed with data disks, else false
- `Datadisksize_1,Datadisksize_2,Datadisksize_3,Datadisksize_4,Datadisksize_5` = Provide the values to these variables depending on the number of data disks required (limited to 5 data disks max). Example: if two data disks are needed, provide values Datadisksize_1 = 32, Datadisksize_2 = 64 and ignore rest of the variables. 
- `Datadisktype_1,Datadisktype_2,Datadisktype_3,Datadisktype_4,Datadisktype_5` = Provide the type of data disks that needs to be deployed. Example: if two data disks are to be deployed, provide the values to Datadisktype_1 and Datadisktype_2, ignore the rest. 
- `region`           = region in which VM has to be deployed (eastasia or southeastasia)
- `vm_name`          = Name of the VM
- `operatingsystem`  = operating system with the VM has to be deployed
- `enable_accelerated_networking` = Mark this as true to enabled accelerated networking, Not all VM sizes support this feature
- `vm_size`          = size of the VM
- `systemidentity_required` = Mark this as true to enable system identity
- `osdisk_type`      = OS disk type
- `vnet_name`        = azure vnet name
- `vnet_resourcegroup_name` = vnet resource group
- `subnet_name`      = subnet name
- `enable_vm_auto_shutdown_start` = Mark this as true to enable autoshown on a VM
- `subscription`     = subscription in which the VM wil be deployed with backup enabled
- `subscription_id`  = id of the subscription in which the VM is going to be deployed
- `custm_mngdkey_encryp_datadisks` = Boolean, Mark this as true if OS and Data disk are to be encrypted with custom managed keys. if Marked no, disks will be encrypted with platform managed 
- `ansible_tower_env` = Ansible tower environment to use to run post deploymnet configuration. Possible values are "uat" or "prod".
keys

## Usage

```hcl
module "linuxvm" {
  source = "app.terraform.io/aia_automation/rhelvm/azure"
  ########Virtual Machine configuration###############
  create_resource_group         = false
  resource_group_name           = "rg-go02-eas-n-terraform-test"
  availability_zone             = false
  zone                          = null
  create_availability_set       = true
  availabilityset-name          = "as-go02-sea-n-aiademo"
  region                        = "eastasia"
  vm_name                       = "GOAZEDLTFC0123"
  operatingsystem               = "Redhat7"
  vm_size                       = "Standard_DS1_v2"
  osdisk_type                   = "Standard_DS1_v2"
  datadisks_required            = true
  environment                   = "N"
  Datadisksize_1                = 32
  Datadisksize_2                = 64
  Datadisksize_3                = 64
  Datadisksize_4                = 128
  Datadisksize_5                = 128
  Datadisktype_1                = "Standard_DS1_v2"
  Datadisktype_2                = "Standard_DS1_v2"
  Datadisktype_3                = "Standard_DS1_v2"
  Datadisktype_4                = "Standard_DS1_v2"
  Datadisktype_5                = "Standard_DS1_v2"
  enable_accelerated_networking = false
  systemidentity_required       = true
  subscription                  = "go02"
     

  ########Network Configuration#######################
  vnet_name                     = "vnet-go02-eas-p-nonprodsrv01"
  vnet_resourcegroup_name       = "rg-go02-eas-p-nonprodsrv01-network01"
  subnet_name                   = "subnet-d-nonprod-ts01-10.238.16.128-26"
    
  #########Virtual Machine autoshutdown###############
  enable_vm_auto_shutdown_start = true

  #############Ansible Tower Configuration#############
  ansible_tower_env = "uat"

  tags = merge( local.common_tags, local.extra_tags)
}

locals {
  common_tags = {
    ibm_imi_managed              = "Yes"
    ibm_imi_managedservices_tier = "enterprise"
    AppMSPName                   = "Infra provisioning"
    ServerRole                   = "Redhat-LinuxVM"
  }
  extra_tags = {
    Environment                  = "N"
    ProjectName                  = "Terraform"
    ApplicationName              = "Terraform cloud"
    ApplicationType              = "Cloud"
    ibm_imi_managed_env          = "non-prod"
    BusinessUnit                 = "go02"
    CostCenter                   = "WBS"
    WBSCode                      = "poc"
    ServerOwner                  = "XYZ@aia.com"
    BusinessOwner                = "XYZ"
    RequestItemNumber            = "RITM00123"
    ApplicationService           = "VM test deployment"
    BusinessApplication          = "Snow test deployment"
  }
}
```

## Outputs

- `LinuxVM_Name` = Name of the Virtual Machine created
- `LinuxVM_PrivateIP` = Private IP address of the newly created Virtual machine
- `systemidentity_id` = id of the system identity will be displayed, if enabled
