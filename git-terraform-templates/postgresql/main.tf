#--------------------------------------------------------
# Postgres SQL Server resource
#--------------------------------------------------------
module "postgresql" {
  source                             = "app.terraform.io/aia_automation/postgresql/azure"
  version                            = "1.9.61"
  create_resource_group              = var.create_resource_group
  create_secondary_resource_group    = var.create_secondary_resource_group
  name                               = var.name
  resource_group_name                = var.resource_group_name
  secondary_resource_group_name      = var.secondary_resource_group_name
  location                           = var.location
  postgres_version                   = var.postgres_version
  sku_name                           = var.sku_name
  storage_mb                         = var.storage_mb
  geo_redundant_backup_enabled       = var.geo_redundant_backup_enabled
  replicaname                        = var.replicaname
  email_addresses2                   = var.email_addresses2
  email_addresses3                   = var.email_addresses3
  backup_retention_days              = var.backup_retention_days
  replication                        = var.replication
  data_encryption                    = var.data_encryption
  environment                        = var.environment
  application_name                   = var.application_name
  project_name                       = var.project_name
  request_item_number                = var.request_item_number
  application_service                = var.application_service
  business_application               = var.business_application
  ibm_imi_managed_env                = var.ibm_imi_managed_env
  server_owner                       = var.server_owner
  business_unit                      = var.business_unit
  business_owner                     = var.business_owner
  cost_center                        = var.cost_center
  wbs_code                           = var.wbs_code
  # startip                            = var.startip
  # endip                              = var.endip
  subscription                       = var.subscription
  vnet_resource_group                = var.vnet_resource_group
  vnet_name                          = var.vnet_name
  vnet_subnet1_name                  = var.vnet_subnet1_name
  vnet_subnet2_name                  = var.vnet_subnet2_name
  vnet_resource_group_secondary      = var.vnet_resource_group_secondary
  vnet_name_secondary                = var.vnet_name_secondary
  vnet_subnet_name_secondary         = var.vnet_subnet_name_secondary
  vnet_subnet_name2_secondary        = var.vnet_subnet_name2_secondary
}
