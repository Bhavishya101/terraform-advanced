module "sqlmi" {
	source  						= "app.terraform.io/aia_automation/sqlmi/azure"
    version                         = "0.8.165"
    create_resource_group           = var.create_resource_group
    resource_group_name				= var.resource_group_name
    location                        = var.location
    sqlmi_name                      = var.sqlmi_name
    proxyoverride                   = var.proxyoverride
    timezone                        = var.timezone
    vcore                           = var.vcore
    storage_gb                      = var.storage_gb
    license_type                    = var.license_type
    backup_retention_days           = var.backup_retention_days
    dbname                          = var.dbname
    environment                     = var.environment
    application_name                = var.application_name
    project_name                    = var.project_name
    request_item_number             = var.request_item_number
    application_service             = var.application_service
    business_application            = var.business_application
    ibm_imi_managed_env             = var.ibm_imi_managed_env
    server_owner                    = var.server_owner
    business_unit                   = var.business_unit
    business_owner                  = var.business_owner
    cost_center                     = var.cost_center
    wbs_code                        = var.wbs_code
    replicaresourcegroup            = var.replicaresourcegroup
    replicaresourcename             = var.replicaresourcename
    vnet_subnet_name                = var.vnet_subnet_name
    vnet_resource_group             = var.vnet_resource_group
    vnet_name                       = var.vnet_name
    deployment_mode                 = var.deployment_mode
    server_type                     = var.server_type
    subscription                    = var.subscription
}