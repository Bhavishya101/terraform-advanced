# module "sqlmi" {
# 	source  						= "./modules/terraform-azure-sqlmi"
#     #version                         = "0.8.158"
#     create_resource_group           = false
#     resource_group_name				= var.resource_group_name
#     location                        = var.location
#     sqlmi_name                      = var.sqlmi_name
#     proxyoverride                   = var.proxyoverride
#     timezone                        = var.timezone
#     collation                       = var.collation
#     vcore                           = var.vcore
#     storage_gb                      = var.storage_gb
#     license_type                    = var.license_type
#     server_owner                    = var.server_owner
#     application_service             = var.application_service
#     business_application            = var.business_application
#     business_owner                  = var.business_owner
#     cost_center                     = var.cost_center
#     wbs_code                        = var.wbs_code
#     vnet_subnet_name                = var.vnet_subnet_name
#     vnet_resource_group             = var.vnet_resource_group
#     vnet_name                       = var.vnet_name
#     deployment_mode                 = var.deployment_mode
#     subscription                    = var.subscription 
#     #backup_retention_days           = var.backup_retention_days
#     #dbname                          = var.dbname
#     #environment                     = var.environment
#     #application_name                = var.application_name
#     #project_name                    = var.project_name
#     #request_item_number             = var.request_item_number
#     #ibm_imi_managed_env             = var.ibm_imi_managed_env
#     #business_unit                   = var.business_unit
#     #server_type                     = var.server_type 
# }

#---------------------
# SQL MI Primary 
#---------------------

/*
module "sqlmi_primary" {
	source  						= "./modules/terraform-azure-sqlmi"
    #version                         = "0.8.158"
    create_resource_group           = false
    resource_group_name			    = "rg-go02-eas-n-terraform-test"
    location                        = "eastasia"
    sqlmi_name                      = "hpget09sqlmitest"
    proxyoverride                   = "Proxy"
    timezone                        = "China Standard Time"
    collation                       = "SQL_Latin1_General_CP1_CI_AS"
    vcore                           = 4
    storage_gb                      = 32
    license_type                    = "LicenseIncluded"
    server_owner                    = "bhavishya-b.gupta@aia.com"
    application_service             = "AIA-TEST"
    business_application            = "AIA-TEST"
    business_owner                  = "bhavishya-b.gupta@aia.com"
    cost_center                     = "R1.TTC1.06.1"
    wbs_code                        = ""
    replicaresourcegroup            = "rg-go02-eas-n-terraform-test"     # Update the secondary Resource Group
    replicaresourcename             = "hpget09sqlmitestsec"                 # update the secondary SQL MI Name
    vnet_subnet_name                = "subnet-d-ccoe-lab02-10.238.223.0-24"
    vnet_resource_group             = "rg-go02-eas-p-nonprodsrv01-network01"
    vnet_name                       = "vnet-go02-eas-p-nonprodsrv01"
    subscription                    = "GO02" 
    backup_retention_days           = 7
    dbname                          = "dbgoazepmdbdutest09"
    environment                     = "D"
    application_name                = "sqlmi"
    project_name                    = "Terraform-Automation"
    request_item_number             = "RITM0088900"
    ibm_imi_managed_env             = "P"
    business_unit                   = "GO02"
    deployment_mode                 = "Replication"
    server_type                     = "Primary"
}
*/

#---------------------
# SQL MI Secondary 
#---------------------
/*
module "sqlmi_secondary" {
	source  						= "./modules/terraform-azure-sqlmi"
    #version                         = "0.8.158"
    create_resource_group           = false
    resource_group_name			    = "rg-go02-eas-n-terraform-test"
    location                        = "southeastasia"
    sqlmi_name                      = "hpget09sqlmitestsec"
    proxyoverride                   = "Proxy"
    timezone                        = "China Standard Time"
    collation                       = "SQL_Latin1_General_CP1_CI_AS"
    vcore                           = 4
    storage_gb                      = 32
    license_type                    = "LicenseIncluded"
    server_owner                    = "bhavishya-b.gupta@aia.com"
    application_service             = "AIA-TEST-Secondary"
    business_application            = "AIA-TEST-Secondary"
    business_owner                  = "bhavishya-b.gupta@aia.com"
    cost_center                     = "R1.TTC1.06.1"
    wbs_code                        = ""
    replicaresourcegroup            = ""
    replicaresourcename             = ""
    vnet_subnet_name                = "subnet-n-nonprod-iddbmi01-10.220.128.64-27"
    vnet_resource_group             = "rg-go02-sea-n-nonprod-network01"
    vnet_name                       = "vnet-go02-sea-n-gmmsrv01"
    subscription                    = "GO02" 
    backup_retention_days           = 7
    dbname                          = ""
    environment                     = "D"
    application_name                = "sqlmi"
    project_name                    = "Terraform-Automation"
    request_item_number             = "RITM0088900"
    ibm_imi_managed_env             = "P"
    business_unit                   = "GO02"
    deployment_mode                 = "Replication"
    server_type                     = "Secondary"
}
*/


#---------------------
# SQL MI Standalone - East asia
#---------------------
/*
module "sqlmi_standalone" {
	  source  						            = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-sqlmi.git?ref=B-Dev"
    #version                        = "0.8.158"
    create_resource_group           = false
    resource_group_name			        = "rg-go02-eas-n-terraform-test"
    location                        = "eastasia"
    sqlmi_name                      = "hpget09sqlmitest01"
    proxyoverride                   = "Proxy"
    timezone                        = "China Standard Time"
    collation                       = "SQL_Latin1_General_CP1_CI_AS"
    vcore                           = 4
    storage_gb                      = 32
    license_type                    = "LicenseIncluded"
    server_owner                    = "bhavishya-b.gupta@aia.com"
    application_service             = "AIA-TEST"
    business_application            = "AIA-TEST"
    business_owner                  = "bhavishya-b.gupta@aia.com"
    cost_center                     = "R1.TTC1.06.1"
    wbs_code                        = ""
    replicaresourcegroup            = "rg-go02-eas-n-terraform-test"     # Update the secondary Resource Group
    replicaresourcename             = "hpget09sqlmitestsec"                 # update the secondary SQL MI Name
    vnet_subnet_name                = "subnet-d-ccoe-lab02-10.238.223.0-24"
    vnet_resource_group             = "rg-go02-eas-p-nonprodsrv01-network01"
    vnet_name                       = "vnet-go02-eas-p-nonprodsrv01"
    subscription                    = "GO02" 
    backup_retention_days           = 7
    dbname                          = "dbgoazepmdbdu09"      # dbgoazepmdbdutest09 -- Old
    environment                     = "P"
    application_name                = "sqlmi"
    project_name                    = "Terraform-Automation"
    request_item_number             = "RITM0088900"
    ibm_imi_managed_env             = "P"
    business_unit                   = "GO02"
    deployment_mode                 = "Standalone"
    server_type                     = "Primary"
    ibm_imi_managed                 = "No"
}
*/

#-------------------------------------
# SQL MI Standalone - Australia east
#-------------------------------------
/*
module "sqlmi_standalone" {
	#source  						= "./modules/terraform-azure-sqlmi"
    source                          = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-sqlmi.git?ref=au01"
    #version                        = "0.8.158"
    create_resource_group           = false
    resource_group_name			      	= "rg-au01-aue-n-terraform-test"
    location                        = "australiaeast"
    sqlmi_name                      = "hpget08sqlmitest"
    proxyoverride                   = "Proxy"
    timezone                        = "China Standard Time"
    collation                       = "SQL_Latin1_General_CP1_CI_AS"
    vcore                           = 4
    storage_gb                      = 32
    license_type                    = "LicenseIncluded"
    server_owner                    = "bhavishya-b.gupta@aia.com"
    application_service             = "AIA-TEST"
    business_application            = "AIA-TEST"
    business_owner                  = "bhavishya-b.gupta@aia.com"
    cost_center                     = "poc"
    wbs_code                        = ""
    vnet_subnet_name                = "subnet-s-nonprod-casetracksql01-10.236.166.64-26"  #subnet-d-ccoe-lab02-10.236.145.0-24
    vnet_resource_group             = "rg-AU01-aue-n-nonprodsrv01-network01"
    vnet_name                       = "vnet-au01-aue-n-nonprodsrv01"
    subscription                    = "AU01" 
    backup_retention_days           = 8
    dbname                          = "dbgoazepmdbdutest09"
    environment                     = "P"
    application_name                = "sqlmi"
    project_name                    = "Terraform-Automation"
    request_item_number             = "RITM0088900"
    ibm_imi_managed_env             = "P"
    ibm_imi_managed                 = "No"
    business_unit                   = "AU01"
    deployment_mode                 = "Standalone"
    server_type                     = "Primary"    
}
*/


#-------------------------------------
# SQL MI Standalone - Australia South east
#-------------------------------------
/*
module "sqlmi_standalone" {
	#source  						= "./modules/terraform-azure-sqlmi"
    source                          = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-sqlmi.git?ref=au01"
    #version                        = "0.8.158"
    create_resource_group           = false
    resource_group_name			      	= "rg-au01-aue-n-terraform-test"
    location                        = "australiasoutheast"
    sqlmi_name                      = "hpget07sqlmitest"
    proxyoverride                   = "Proxy"
    timezone                        = "China Standard Time"
    collation                       = "SQL_Latin1_General_CP1_CI_AS"
    vcore                           = 4
    storage_gb                      = 32
    license_type                    = "LicenseIncluded"
    server_owner                    = "bhavishya-b.gupta@aia.com"
    application_service             = "AIA-TEST"
    business_application            = "AIA-TEST"
    business_owner                  = "bhavishya-b.gupta@aia.com"
    cost_center                     = "poc"
    wbs_code                        = ""
    vnet_subnet_name                = "subnet-d-ccoe-lab01-10.237.144.0-24"  #subnet-d-ccoe-lab02-10.236.145.0-24
    vnet_resource_group             = "rg-AU01-aus-n-nonprodsrv01-network01"
    vnet_name                       = "vnet-au01-aus-n-nonprodsrv01"
    subscription                    = "AU01" 
    backup_retention_days           = 8
    dbname                          = "dbgoazepmdbdutest09"
    environment                     = "P"
    application_name                = "sqlmi"
    project_name                    = "Terraform-Automation"
    request_item_number             = "RITM0088900"
    ibm_imi_managed_env             = "P"
    ibm_imi_managed                 = "No"
    business_unit                   = "AU01"
    deployment_mode                 = "Standalone"
    server_type                     = "Primary"    
}
*/
#---------------------
# Storage Account
#---------------------

/*
module "storageaccount" {
  #source                    = "app.terraform.io/aia_automation/storage/azure"
  source                    = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-storage.git?ref=B-Dev"
  create_resource_group     = false
  resource_group_name       = "rg-go02-eas-n-terraform-test"
  location                  = "eastasia"
  storage_account_name      = "hpget09sacc09"
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  is_hns_enabled            = true
  ibm_imi_managed           = "No"
  ibm_imi_managed_env       = "P"
  application_name          = "test09"
  application_service       = "EPO Console test"
  business_application      = "SERVICE NOW - TEST"
  business_owner            = "bhavishya-b.gupta@aia.com"
  business_unit             = "4GO0245789"
  cost_center               = "R1.TTC1.06.1"
  environment               = "P"
  request_item_number       = "RITM0088900"
  project_name              = "hpget09"
  server_owner              = "bhavishya-b.gupta@aia.com"
  vnet_resource_group       = "rg-go02-eas-p-nonprodsrv01-network01"
  vnet_name                 = "vnet-go02-eas-p-nonprodsrv01"
  vnet_subnet1_name         = "subnet-d-ccoe-lab02-10.238.223.0-24"
  vnet_subnet2_name         = "null"
  wbs_code                  = ""
  subscription              = "GO02"
}
*/

#------------------------------
# SQL Database - East Asia
#------------------------------
/*
module "sqldatabase" {
  source                                          = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-sqldatabase.git?ref=B-Dev"
  subscription                                    = "GO02"
  location                                        = "eastasia"
  resource_group_name                             = "rg-go02-eas-n-terraform-test"
  create_resource_group                           = false
  secondary_resource_group_name                   = "rg-go02-eas-n-terraform-test"
  create_secondary_resource_group                 = false
  database_name                                   = "testapp05"
  sqlserver_name                                  = "sqldbserver-test05"
  sqlserver_secondary_name                        = "sqldbserver-test06"
  sqlserver_version                               = "12.0"
  failovergroupname                               = "testfailgroup"
  enable_elastic_pool                             = true
  enable_failover_group                           = false
  allow_azure_service                             = false
  sku_name                                        = "BC_Gen5_2"
  elasticpool_sku_capacity                        = 4
  elasticpool_max_size_gb                         = 10
  elasticpool_per_database_settings_min_capacity  = 0.25
  elasticpool_per_database_settings_max_capacity  = 1
  data_encryption                                 = false
  #startip                                         = "NA"
  #endip                                           = "NA"
  vnet_resource_group                             = "rg-go02-eas-p-nonprodsrv01-network01"
  vnet_name                                       = "vnet-go02-eas-p-nonprodsrv01"
  vnet_subnet_name                                = "subnet-d-nonprod-ts01-10.238.16.128-26"
  vnet_subnet_name2                               = "null"
  environment                                     = "P"
  project_name                                    = "proj07"
  application_name                                = "app07"
  license_type                                    = "LicenseIncluded"
  max_size_gb                                     = 250
  ibm_imi_managed                                 = "No"
  ibm_imi_managed_env                             = "P"
  business_unit                                   = "GO02"
  cost_center                                     = "R1.TTC1.06.1"
  wbs_code                                        = "PoC infra provisioning"
  server_owner                                    = "xyz@servicenow.com"
  business_owner                                  = "xyz@servicenow.com"
  application_service                             = "EPO Console Test"
  business_application                            = "SERVICENOW - TEST"
  request_item_number                             = "RITM0088864"
}
*/

#------------------------------
# SQL Database - Australia
#------------------------------
/*
module "sqldatabase" {
  source                                          = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-sqldatabase.git?ref=au01"
  subscription                                    = "AU01"
  location                                        = "australiaeast"
  resource_group_name                             = "rg-au01-aue-n-terraform-test"
  create_resource_group                           = false
  secondary_resource_group_name                   = "rg-au01-aue-n-terraform-test"
  create_secondary_resource_group                 = false
  database_name                                   = "testapp05"
  sqlserver_name                                  = "sqldbserver-test05"
  sqlserver_secondary_name                        = "sqldbserver-test06"
  sqlserver_version                               = "12.0"
  failovergroupname                               = "testfailgroup"
  enable_elastic_pool                             = true
  enable_failover_group                           = false
  allow_azure_service                             = false
  sku_name                                        = "BC_Gen5_2"
  elasticpool_sku_capacity                        = 4
  elasticpool_max_size_gb                         = 10
  elasticpool_per_database_settings_min_capacity  = 0.25
  elasticpool_per_database_settings_max_capacity  = 1
  data_encryption                                 = false
  #startip                                         = "NA"
  #endip                                           = "NA"
  vnet_resource_group                             = "rg-AU01-aue-n-nonprodsrv01-network01"
  vnet_name                                       = "vnet-au01-aue-n-nonprodsrv01"
  vnet_subnet_name                                = "subnet-d-ccoe-lab02-10.236.145.0-24"
  vnet_subnet_name2                               = "null"
  environment                                     = "P"
  project_name                                    = "proj07"
  application_name                                = "app07"
  license_type                                    = "LicenseIncluded"
  max_size_gb                                     = 250
  ibm_imi_managed                                 = "No"
  ibm_imi_managed_env                             = "P"
  business_unit                                   = "AU01"
  cost_center                                     = "test"
  wbs_code                                        = "PoC infra provisioning"
  server_owner                                    = "bhavishya-b.gupta@aia.com"
  business_owner                                  = "bhavishya-b.gupta@aia.com"
  application_service                             = "EPO Console Test"
  business_application                            = "SERVICENOW - TEST"
  request_item_number                             = "RITM0088864"
}
*/

#---------------------
# Load Balancer
#---------------------

/*
module "loadbalancer" {
  source                            = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-loadbalancer.git?ref=B-Dev"
  subscription                      = "GO02"
  create_resource_group             = false
  resource_group_name               = "rg-go02-eas-n-terraform-test"
  location                          = "eastasia"
  lb_name                           = "hpget02-lb-test-01"
  lb_probe_port                     = 80
  lb_probe_protocol                 = "TCP"
  lb_rule_backend_port              = 80
  lb_rule_frontend_port             = 1433
  backend_pool_VM_Name1             = "GOAZENTFC001"
  backend_pool_VM_Name2             = "GOAZENTFC002"
  backend_pool_VM_Name3             = null
  backend_pool_VM_Name4             = null
  backend_pool_VM_Name5             = null
  ibm_imi_managed_env               = "P"
  application_name                  = "app07"
  application_service               = "EPO Console test"
  business_application              = "SERVICE NOW - TEST"
  business_owner                    = "bhavishya-b.gupta@aia.com"
  business_unit                     = "SG01"
  ibm_imi_managed                   = "No"
  cost_center                       = "R1.TTC1.06.1"
  environment                       = "P"
  request_item_number               = "RITM0088468"
  project_name                      = "proj07"
  server_owner                      = "bhavishya-b.gupta@aia.com"
  vnet_resource_group               = "rg-go02-eas-p-nonprodsrv01-network01"
  vnet_name                         = "vnet-go02-eas-p-nonprodsrv01"
  vnet_subnet_name                  = "subnet-d-nonprod-ts01-10.238.16.128-26"
  wbs_code                          = ""
}
*/


#---------------------
# Postgres SQL
#---------------------

/*
module "postgresql" {
  source                             = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-postgresql.git?ref=B-Dev"
  create_resource_group              = false
  create_secondary_resource_group    = false
  name                               = "hpget02testdb01"
  resource_group_name                = "rg-go02-eas-n-terraform-test"
  secondary_resource_group_name      = "rg-go02-eas-n-terraform-test"
  location                           = "eastasia"
  vnet_name                          = "vnet-go02-eas-p-nonprodsrv01"
  vnet_resource_group                = "rg-go02-eas-p-nonprodsrv01-network01"
  vnet_subnet1_name                  = "subnet-d-ccoe-lab02-10.238.223.0-24"
  postgres_version                   = 11
  sku_name                           = "GP_Gen5_4"
  storage_mb                         = 40960
  geo_redundant_backup_enabled       = false
  replicaname                        = "sgazedrgdb0001"
  email_addresses2                  = "bhavishya-b.gupta@aia.com"
  email_addresses3                  = "bhavishya-b.gupta@aia.com"
  backup_retention_days              = 7
  replication                        = false
  data_encryption                    = false
  environment                        = "n"
  application_name                   = "PostgreSQL"
  project_name                       = "AIA Terraform"
  request_item_number                = "RITM00123"
  application_service                = "AS"
  business_application               = "BS"
  ibm_imi_managed                    = "No"
  ibm_imi_managed_env                = "N"
  server_owner                       = "bhavishya-b.gupta@aia.com"
  business_unit                      = "GO02"
  business_owner                     = "bhavishya-b.gupta@aia.com"
  cost_center                        = "R1.TTC1.06.1"
  wbs_code                           = ""  
  #startip                            = 192.168.1.0
  #endip                              = 192.168.1.255
  #ARM_TENANT_ID                      = "7f2c1900-9fd4-4b89-91d3-xxxxxxxxxxxx"
  subscription                       = "GO02"
}
*/

#---------------------------------
# Postgres SQL - Australia
#---------------------------------
/*
module "postgresql" {
  source                             = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-postgresql.git?ref=au01"
  create_resource_group              = false
  create_secondary_resource_group    = false
  name                               = "hpget02testdb01"
  resource_group_name                = "rg-au01-aue-n-terraform-test"
  secondary_resource_group_name      = "rg-au01-aue-n-terraform-test"
  location                           = "australiaeast"
  vnet_name                          = "vnet-au01-aue-n-nonprodsrv01"
  vnet_resource_group                = "rg-AU01-aue-n-nonprodsrv01-network01"
  vnet_subnet1_name                  = "subnet-d-ccoe-lab02-10.236.145.0-24"
  postgres_version                   = 11
  sku_name                           = "GP_Gen5_4"
  storage_mb                         = 40960
  geo_redundant_backup_enabled       = false
  replicaname                        = "sgazedrgdb0001"
  email_addresses2                  = "bhavishya-b.gupta@aia.com"
  email_addresses3                  = "bhavishya-b.gupta@aia.com"
  backup_retention_days              = 7
  replication                        = false
  data_encryption                    = false
  environment                        = "P"
  application_name                   = "PostgreSQL"
  project_name                       = "AIA Terraform"
  request_item_number                = "RITM00123"
  application_service                = "AS"
  business_application               = "BS"
  ibm_imi_managed                    = "No"
  ibm_imi_managed_env                = "N"
  server_owner                       = "bhavishya-b.gupta@aia.com"
  business_unit                      = "AU01"
  business_owner                     = "bhavishya-b.gupta@aia.com"
  cost_center                        = ""
  wbs_code                           = ""  
  #startip                            = 192.168.1.0
  #endip                              = 192.168.1.255
  #ARM_TENANT_ID                      = "7f2c1900-9fd4-4b89-91d3-xxxxxxxxxxxx"
  subscription                       = "AU01"
}
*/


#--------------------------------------
#  Linux VM - East Asia
#--------------------------------------
/*
module "linuxvm" {
  source = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-rhelvm.git?ref=B-Dev"
  ########Virtual Machine configuration###############
  create_resource_group         = false
  resource_group_name           = "rg-go02-eas-n-terraform-test"
  availability_zone             = false
  zone                          = 1
  create_availability_set       = false
  availabilityset_name          = ""
  region                        = "eastasia"
  vm_name                       = "AUAZEDLTFCTEST0123"
  operatingsystem               = "RHEL8"
  vm_size                       = "Standard_DS1_v2"
  osdisk_type                   = "Standard_LRS"
  datadisks_required            = false
  custm_mngdkey_encryp_datadisks = false
  environment                   = "D"
  Datadisksize_1                = 32
  Datadisksize_2                = 64
  Datadisksize_3                = 64
  Datadisksize_4                = 128
  Datadisksize_5                = 128
  Datadisktype_1                = "Standard_LRS"
  Datadisktype_2                = "Standard_LRS"
  Datadisktype_3                = "Standard_LRS"
  Datadisktype_4                = "Standard_LRS"
  Datadisktype_5                = "Standard_LRS"
  enable_accelerated_networking = false
  systemidentity_required       = true
  subscription                  = "GO02"
  ########Network Configuration#######################
  vnet_name                     = "vnet-go02-eas-p-nonprodsrv01"
  vnet_resourcegroup_name       = "rg-go02-eas-p-nonprodsrv01-network01"
  subnet_name                   = "subnet-d-ccoe-lab01-10.238.222.0-24"
  #########Virtual Machine autoshutdown###############
  enable_vm_auto_shutdown_start = true
  #############Ansible Tower Configuration#############
  ansible_tower_env = "uat"
  tags = {
    Environment         = "D"
    ProjectName         = "Terraform"
    ApplicationName     = "Terraform cloud"
    application_type    = "Cloud"
    ibm_imi_managed_env = "D"
    ibm_imi_managed     = "No"
    ibm_imi_managedservices_tier = "enterprise"
    BusinessUnit        = "go02"
    CostCenter          = "AUTEST"
    wbs_code            = "poc"
    ServerOwner         = "bhavishya@aia.com"
    BusinessOwner       = "bhavishya"
    RequestItemNumber   = "RITM00123"
    ApplicationService  = "VM test deployment"
    BusinessApplication = "Snow test deployment"
    ServerRole          = "Redhat-LinuxVM"
  }
}
*/

#--------------------------------------
#  Linux VM - Australia east
#--------------------------------------
/*
module "linuxvm" {
  source = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-rhelvm.git?ref=au01"
  ########Virtual Machine configuration###############
  create_resource_group         = false
  resource_group_name           = "rg-au01-aue-n-terraform-test"
  availability_zone             = false
  zone                          = 1
  create_availability_set       = false
  availabilityset_name          = ""
  region                        = "australiaeast"
  vm_name                       = "AUAZEDLTFCTEST0123"
  operatingsystem               = "RHEL8"
  vm_size                       = "Standard_DS1_v2"
  osdisk_type                   = "Standard_LRS"
  datadisks_required            = false
  custm_mngdkey_encryp_datadisks = false
  environment                   = "D"
  Datadisksize_1                = 32
  Datadisksize_2                = 64
  Datadisksize_3                = 64
  Datadisksize_4                = 128
  Datadisksize_5                = 128
  Datadisktype_1                = "Standard_LRS"
  Datadisktype_2                = "Standard_LRS"
  Datadisktype_3                = "Standard_LRS"
  Datadisktype_4                = "Standard_LRS"
  Datadisktype_5                = "Standard_LRS"
  enable_accelerated_networking = false
  systemidentity_required       = true
  subscription                  = "au01"
  ########Network Configuration#######################
  vnet_name                     = "vnet-au01-aue-n-nonprodsrv01"
  vnet_resourcegroup_name       = "rg-AU01-aue-n-nonprodsrv01-network01"
  subnet_name                   = "subnet-d-ccoe-lab02-10.236.145.0-24"
  #########Virtual Machine autoshutdown###############
  enable_vm_auto_shutdown_start = true
  #############Ansible Tower Configuration#############
  ansible_tower_env = "uat"
  tags = {
    Environment         = "D"
    ProjectName         = "Terraform"
    ApplicationName     = "Terraform cloud"
    application_type    = "Cloud"
    ibm_imi_managed_env = "D"
    ibm_imi_managed     = "No"
    ibm_imi_managedservices_tier = "enterprise"
    BusinessUnit        = "go02"
    CostCenter          = "AUTEST"
    wbs_code            = "poc"
    ServerOwner         = "bhavishya@aia.com"
    BusinessOwner       = "bhavishya"
    RequestItemNumber   = "RITM00123"
    ApplicationService  = "VM test deployment"
    BusinessApplication = "Snow test deployment"
    ServerRole          = "Redhat-LinuxVM"
  }
}
*/

#---------------------------------
# Windows Vm -  East Asia
#---------------------------------
/*
module "windowsvm" {
  source = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-windowsvm.git?ref=B-Dev"
  ########Virtual Machine configuration###############
  create_resource_group         = false
  resource_group_name           = "rg-go02-eas-n-terraform-test"
  availability_zone             = false
  zone                          = 1
  create_availability_set       = false
  availabilityset_name          = ""
  region                        = "eastasia"
  vm_name                       = "AUAZEDLTFCTST10"  #AUAZEDLTFCTEST0123
  operatingsystem               = "windows2016"
  vm_size                       = "Standard_DS1_v2"
  osdisk_type                   = "Standard_LRS"
  datadisks_required            = false
  custm_mngdkey_encryp_datadisks = false
  environment                   = "P"
  Datadisksize_1                = 32
  Datadisksize_2                = 64
  Datadisksize_3                = 64
  Datadisksize_4                = 128
  Datadisksize_5                = 128
  Datadisktype_1                = "Standard_LRS"
  Datadisktype_2                = "Standard_LRS"
  Datadisktype_3                = "Standard_LRS"
  Datadisktype_4                = "Standard_LRS"
  Datadisktype_5                = "Standard_LRS"
  enable_accelerated_networking = false
  systemidentity_required       = true
  subscription                  = "GO02"


  ########Network Configuration#######################
  vnet_name                     = "vnet-go02-eas-p-nonprodsrv01"
  vnet_resourcegroup_name       = "rg-go02-eas-p-nonprodsrv01-network01"
  subnet_name                   = "subnet-d-ccoe-lab01-10.238.222.0-24"

  #########Virtual Machine autoshutdown###############
  enable_vm_auto_shutdown_start = true

  #############Ansible Tower Configuration#############
  ansible_tower_env = "uat"

  tags = {
    Environment         = "D"
    ProjectName         = "Terraform"
    ApplicationName     = "Terraform cloud"
    application_type    = "Cloud"
    ibm_imi_managed_env = "D"
    ibm_imi_managed     = "No"
    ibm_imi_managedservices_tier = "enterprise"
    BusinessUnit        = "au01"
    CostCenter          = "AUTEST"
    wbs_code            = "poc"
    ServerOwner         = "bhavishya@aia.com"
    BusinessOwner       = "bhavishya@aia.com"
    RequestItemNumber   = "RITM00123456"
    ApplicationService  = "Terraform Test"
    BusinessApplication = "Terraform Test"
    ServerRole          = "Windows2016-VM"
  }
}
*/

#---------------------------------
# Windows Vm - Australia east
#---------------------------------
/*
module "windowsvm" {
  source = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-windowsvm.git?ref=au01"
  ########Virtual Machine configuration###############
  create_resource_group         = false
  resource_group_name           = "rg-au01-aue-n-terraform-test"
  availability_zone             = false
  zone                          = 1
  create_availability_set       = false
  availabilityset_name          = ""
  region                        = "australiaeast"
  vm_name                       = "AUAZEDLTFCTST10"  #AUAZEDLTFCTEST0123
  operatingsystem               = "windows2016"
  vm_size                       = "Standard_DS1_v2"
  osdisk_type                   = "Standard_LRS"
  datadisks_required            = false
  custm_mngdkey_encryp_datadisks = false
  environment                   = "P"
  Datadisksize_1                = 32
  Datadisksize_2                = 64
  Datadisksize_3                = 64
  Datadisksize_4                = 128
  Datadisksize_5                = 128
  Datadisktype_1                = "Standard_LRS"
  Datadisktype_2                = "Standard_LRS"
  Datadisktype_3                = "Standard_LRS"
  Datadisktype_4                = "Standard_LRS"
  Datadisktype_5                = "Standard_LRS"
  enable_accelerated_networking = false
  systemidentity_required       = true
  subscription                  = "au01"


  ########Network Configuration#######################
  vnet_name                     = "vnet-au01-aue-n-nonprodsrv01"
  vnet_resourcegroup_name       = "rg-AU01-aue-n-nonprodsrv01-network01"
  subnet_name                   = "subnet-d-ccoe-lab02-10.236.145.0-24"

  #########Virtual Machine autoshutdown###############
  enable_vm_auto_shutdown_start = true

  #############Ansible Tower Configuration#############
  ansible_tower_env = "uat"

  tags = {
    Environment         = "D"
    ProjectName         = "Terraform"
    ApplicationName     = "Terraform cloud"
    application_type    = "Cloud"
    ibm_imi_managed_env = "D"
    ibm_imi_managed     = "No"
    ibm_imi_managedservices_tier = "enterprise"
    BusinessUnit        = "au01"
    CostCenter          = "AUTEST"
    wbs_code            = "poc"
    ServerOwner         = "bhavishya@aia.com"
    BusinessOwner       = "bhavishya@aia.com"
    RequestItemNumber   = "RITM00123456"
    ApplicationService  = "Terraform Test"
    BusinessApplication = "Terraform Test"
    ServerRole          = "Windows2016-VM"
  }
}
*/

#---------------------
#  AKS Cluster
#---------------------

/*
module "kubernetes" {
  source = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-kubernetes.git?ref=B-Dev"
  create_resource_group = false
  resource_group_name = "rg-go02-eas-n-terraform-test"
  location = "eastasia"
  aks_cluster_name = "aks-go02-eas-d-hpget09"
  kubernetes_version  = "1.21.2" 
  vm_size = "Standard_DS2_v2" 
  os_disk_size_gb  = 30 
  os_disk_type = "Managed"
  node_count = 2 

### Node pools 
  node_max_pods = 30 
  node_enable_autoscale  = true  
  node_max_count  =  5 
  node_min_count  =  2 

### Networking
#### vnet
  vnet_name = "vnet-go02-eas-p-nonprodsrv01"
  vnet_resource_group = "rg-go02-eas-p-nonprodsrv01-network01"
  subnet_name = "subnet-d-ccoe-lab01-10.238.222.0-24"

###  Tags
  environment = "D"
  project_name = "hpget09test" 
  application_name =  "hpget09"
  ibm_imi_managed = "No"
  ibm_imi_managed_env = "D"
  business_unit = "GO02" 
  cost_center = "R1.TTC1.06.1" 
  wbs_code = "poc" 
  server_owner = "bhavishya-b.gupta@aia.com" 
  business_owner = "bhavishya-b.gupta@aia.com" 
  application_service = "AIA SSHK Test" 
  business_application = "AIA SSHK Test" 
  request_item_number = "RITM0129118"

}
*/

/*
#---------------------
#  AKS Cluster
#---------------------

module "kubernetes" {
  source = "git::ssh://altssh.bitbucket.org:443/aia-bitbucket/terraform-azure-kubernetes.git?ref=au01"
  create_resource_group = false
  resource_group_name = "rg-au01-aue-n-terraform-test"
  location = "australiaeast"
  aks_cluster_name = "aks-au01-eas-d-hpget09"
  kubernetes_version  = "1.21.2" 
  vm_size = "Standard_DS2_v2" 
  os_disk_size_gb  = 30 
  os_disk_type = "Managed"
  node_count = 2 

### Node pools 
  node_max_pods = 30 
  node_enable_autoscale  = true  
  node_max_count  =  5 
  node_min_count  =  2 

### Networking
#### vnet
  vnet_name = "vnet-au01-aue-n-nonprodsrv01"
  vnet_resource_group = "rg-AU01-aue-n-nonprodsrv01-network01"
  subnet_name = "subnet-d-ccoe-lab02-10.236.145.0-24"

###  Tags
  environment = "D"
  project_name = "hpget09test" 
  application_name =  "hpget09"
  ibm_imi_managed = "No"
  ibm_imi_managed_env = "D"
  business_unit = "AU01" 
  cost_center = "poc" 
  wbs_code = "poc" 
  server_owner = "bhavishya-b.gupta@aia.com" 
  business_owner = "bhavishya-b.gupta@aia.com" 
  application_service = "AIA SSHK Test" 
  business_application = "AIA SSHK Test" 
  request_item_number = "RITM0129118"
}
*/