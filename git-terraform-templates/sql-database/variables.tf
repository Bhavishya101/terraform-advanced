variable "subscription" {
    description = "Name of the Subscription"
}

variable "create_resource_group" {
    description = "Whether to create resource group or use the existing resource group"
}

variable "resource_group_name" {
    description = "The name of the resource group in which to create the resource"
}

variable "create_secondary_resource_group" {
    description = "Whether to create a new resource group or use the existing resource group for secondary server"
    default     = false
}

variable "secondary_resource_group_name" {
    description = "The name of the secondary resource group in which to create the resource"
    default     = ""
}

variable "location" {
    description = "Specifies the supported Azure location where the resource will be created"
}

variable "sqlserver_name" {
    description = "Name of the primary SQL Server"
}

variable "sqlserver_secondary_name" {
    description = "Name of the secondary SQL Server"
}

variable "sqlserver_version" {
    description = " The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
}
/*
variable "startip" {
    description = "Start IP of the firewall"
}

variable "endip" {
    description = "End IP of the firewall"
}
*/
variable "allow_azure_service" {
    description = "Allow access to Azure services"
}   

variable "data_encryption" {
    description = "Transparent data encryption"
}

variable "enable_elastic_pool" {
    description = "Manage SQL Elastic Pool"
}

variable "enable_failover_group" {
    description = "Create a failover group of databases on a collection of Azure SQL servers"
}

#---------------------------------------------------------
# Variables for Elastic Pool
#----------------------------------------------------------
variable "elasticpool_license_type" {
    description = "Specifies the license type applied to the database. Possible values are LicenseIncluded and BasePrice."
}

variable "elasticpool_max_size_gb" {
    description = "The max data size of the elastic pool in gigabytes"
}

variable "elasticpool_sku_capacity" {
    description = "The scale up/out capacity, representing server's compute units"
}

variable "elasticpool_per_database_settings_min_capacity" {
    description = "The minimum capacity all databases are guaranteed."
}

variable "elasticpool_per_database_settings_max_capacity" {
    description = "The maximum capacity any one database can consume"
}

#---------------------------------------------------------
# Variables for Virtual Network Details for Primary SQL Server
#----------------------------------------------------------
variable "vnet_resource_group" {
    description = "Virtual network resource group name"
}

variable "vnet_name" {
    description = "Virtual network name"
}

variable "vnet_subnet_name" {
    description = "First Subnet name"
}

variable "vnet_subnet_name2" {
    description = "Second Subnet name"
}

#---------------------------------------------------------
# Variables for Virtual Network Details for Secondary SQL Server
#----------------------------------------------------------
variable "vnet_resource_group_secondary" {
    description = "Virtual network resource group name"
    default     = "null"
}

variable "vnet_name_secondary" {
    description = "Virtual network name"
    default     = "null"
}

variable "vnet_subnet_name_secondary" {
    description = "First Subnet name"
    default     = "null"
}

variable "vnet_subnet_name2_secondary" {
    description = "Second Subnet name"
    default     = "null"
}

#---------------------------------------------------------
# Variables for Database
#----------------------------------------------------------
variable "database_name" {
    description = "The name of the primary database"
}

variable "failovergroupname" {
    description = "Name of the Failover Group"
}

# variable "readwriteendpoint_failoverpolicy_grace_minutes" {
#     description = "The grace period in minutes before failover with data loss is attempted"
# }

variable "license_type" {
    description = "Specifies the license type applied to the database. Possible values are LicenseIncluded and BasePrice."
}

variable "max_size_gb" {
    description = "The max data size of the elastic pool in gigabytes"
}

variable "sku_name" {
    description = "Specifies the name of the sku used by the database"
}

#---------------------------------------------------------
# Variables for tagging purpose
#----------------------------------------------------------
variable "environment" {
    description = "Environemnt name for the tagging purpose"
}

variable "project_name" {
    description = "Project name for the tagging purpose"
}

variable "application_name" {
    description = "Application name for the tagging purpose"
}

variable "ibm_imi_managed_env"{
    description = "ibm_imi_managed_env for the tagging purpose"
}

variable "business_unit" {
    description = "Business unit for the tagging purpose"
}

variable "cost_center"{
    description = "Cost center for the tagging purpose"
}

variable "wbs_code"{
    description = "WBS code for the tagging purpose"
}

variable "server_owner"{
    description = "Server code for the tagging purpose"
}

variable "business_owner"{
    description = "Business owner for the tagging purpose"
}

variable "application_service" {
    description = "Application Service for the tagging purpose"
}

variable "business_application"{
    description = "Business Application for the tagging purpose"
}

variable "request_item_number" {
    description = "Request Item Number for the tagging purpose"
}