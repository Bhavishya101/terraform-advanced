#--------------------------------------------------------
# Load Balancer Creation Module
#--------------------------------------------------------
module "sqldatabase" {
  source  		                                    = "app.terraform.io/aia_automation/sqldatabase/azure"
  version                                         = "1.0.17"
  create_resource_group                           = var.create_resource_group
  create_secondary_resource_group                 = var.create_secondary_resource_group
  resource_group_name 	                          = var.resource_group_name
  secondary_resource_group_name                   = var.secondary_resource_group_name
  location 		                                    = var.location
  subscription                                    = var.subscription
  database_name                                   = var.database_name
  sku_name                                        = var.sku_name
  sqlserver_version                               = var.sqlserver_version
  sqlserver_name                                  = var.sqlserver_name 
  license_type                                    = var.license_type                                    
  max_size_gb                                     = var.max_size_gb
  allow_azure_service                             = var.allow_azure_service
  enable_elastic_pool                             = var.enable_elastic_pool
  elasticpool_license_type                        = var.elasticpool_license_type
  elasticpool_max_size_gb                         = var.elasticpool_max_size_gb
  elasticpool_sku_capacity                        = var.elasticpool_sku_capacity 
  elasticpool_per_database_settings_min_capacity  = var.elasticpool_per_database_settings_min_capacity
  elasticpool_per_database_settings_max_capacity  = var.elasticpool_per_database_settings_max_capacity
  # readwriteendpoint_failoverpolicy_grace_minutes  = var.readwriteendpoint_failoverpolicy_grace_minutes
  data_encryption                                 = var.data_encryption
  sqlserver_secondary_name                        = var.sqlserver_secondary_name 
  enable_failover_group                           = var.enable_failover_group
  failovergroupname                               = var.failovergroupname
  vnet_resource_group                             = var.vnet_resource_group
  vnet_name                                       = var.vnet_name
  vnet_subnet_name                                = var.vnet_subnet_name
  vnet_subnet_name2                               = var.vnet_subnet_name2 
  vnet_resource_group_secondary                   = var.vnet_resource_group_secondary
  vnet_name_secondary                             = var.vnet_name_secondary
  vnet_subnet_name_secondary                      = var.vnet_subnet_name_secondary
  vnet_subnet_name2_secondary                     = var.vnet_subnet_name2_secondary
  # startip                                         = var.startip
  # endip                                           = var.endip
  project_name 		                                = var.project_name
  server_owner                                    = var.server_owner
  wbs_code 		                                    = var.wbs_code
  application_name  	                            = var.application_name
  application_service                             = var.application_service
  environment                                     = var.environment
  ibm_imi_managed_env 	                          = var.ibm_imi_managed_env
  business_application                            = var.business_application
  business_owner 	                                = var.business_owner
  business_unit 	                                = var.business_unit
  cost_center 		                                = var.cost_center
  request_item_number                             = var.request_item_number
}