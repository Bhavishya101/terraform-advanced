#-----------------------------------------------------------------
#Variables to define name of the resource and replica. 
#-----------------------------------------------------------------
variable "location" {
  description = "The location/region where we are creating the resource"
  type        = string
}

#-----------------------------------------------------------------
#Variables to define name of the resource and replica. 
#-----------------------------------------------------------------
variable "name" {
  description = "Name of the server."
  type        = string
}

variable "replicaname" {
  description = "Name of the replica server."
  type        = string
}

variable "backup_retention_days" {
  description = "Number of days for which the backup is retained."
  type        = string
}

#-----------------------------------------------------------------
#Variables to manage Resource group. 
#-----------------------------------------------------------------
variable "create_resource_group" {
  description = "Whether to create resource group and use it to create the storage account"
  type        = bool
}

variable "resource_group_name" {
  description = "The name of the resource group we want to use"
  type        = string
}

variable "create_secondary_resource_group" {
    description = "Whether to create a new resource group or use the existing resource group for secondary server"
    type        = bool
    default     = false
}

variable "secondary_resource_group_name" {
    description = "The name of the secondary resource group in which to create the resource"
    default     = ""
}

#-----------------------------------------------------------------
#Variables for PostgereSQL for storage 
#-----------------------------------------------------------------

variable "geo_redundant_backup_enabled" {
  description = "Enabling this will store the backup in the region where the server is hosted and also replicated to a paired location."
  type        = bool
 
}

variable "storage_mb" {
  description = "Storage amount required for the database."
  type        = string
}
#-----------------------------------------------------------------
#Variables for PostgereSQL server's advanced options. 
#-----------------------------------------------------------------
variable "sku_name" {
  description = "Name of the pricing teir which is required for the resource."
  type        = string
}

variable "postgres_version" {
  description = "This include the version of the Postgres server, can be ."
  type        = string
}
#-----------------------------------------------------------------
#Variables for threat detection. 
#-----------------------------------------------------------------
variable "email_addresses2" {
  description = "Additional email address for threat detection"
  type        = string
}

variable "email_addresses3" {
  description = "Additional email address for threat detection"
  type        = string
}
/*
#-----------------------------------------------------------------
#Variables for Firewall settings
#-----------------------------------------------------------------
variable "startip" {
  description = "Start IP Address for Firewall settings"
  type        = string
}

variable "endip" {
  description = "End IP Address for Firewall settings"
  type        = string
}
*/
#-----------------------------------------------------------------
#Variables to enable Replication. 
#-----------------------------------------------------------------
variable "data_encryption" {
  description = "Enable or disable data encryption. "
  type        = bool
}

variable "replication" {
  description = "Replication required"
  type        = bool
}

#-----------------------------------------------------------------
#Variables to be fetched from the environment variables. 
#-----------------------------------------------------------------

variable "subscription" {
  description = "Required subscription to fetch the keys"
  type        = string
}


# VNET Details - Optional user Input

variable "vnet_resource_group" {
  description = "Virtual network resource group name"
  type        = string
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
}

variable "vnet_subnet1_name" {
  description = "First Subnet name"
  type        = string
}

variable "vnet_subnet2_name" {
  description = "Second Subnet name"
  type        = string
}

variable "vnet_subnet_name2_secondary" {
  description = "Virtual network name for secondry server"
  type        = string
  default     = "null"
}

variable "vnet_resource_group_secondary" {
  description = "VNET RG for Secondry server"
  type        = string
  default     = "null"
}

variable "vnet_name_secondary" {
  description = "VNET for the secondry server. "
  type        = string
  default     = "null"
}

variable "vnet_subnet_name_secondary" {
  description = "Virtual network name for secondry server"
  type        = string
  default     = "null"
}

#-----------------------------------------------------------------
#Variables for the Key from the keyvault for the data encryption. 
#-----------------------------------------------------------------
variable "environment" {
  description = "Environemnt name for the tagging purpose"
  type        = string
}

variable "request_item_number" {
  description = "Request item number for the tagging purpose"
  type        = string
}

variable "project_name" {
  description = "Project name for the tagging purpose"
  type        = string
}

variable "application_name" {
  description = "Application name for the tagging purpose"
  type        = string
}

variable "ibm_imi_managed_env"{
  description = "ibm_imi_managed_env for the tagging purpose"
  type        = string
}

variable "business_unit" {
  description = "Business unit for the tagging purpose"
  type        = string
}

variable "cost_center"{
  description = "Cost center for the tagging purpose"
  type        = string
}

variable "wbs_code"{
  description = "WBS code for the tagging purpose"
  type        = string
}

variable "server_owner"{
  description = "Server code for the tagging purpose"
  type        = string
}

variable "business_owner"{
  description = "Business owner for the tagging purpose"
  type        = string
}

variable "application_service" {
  description = "Application Service for the tagging purpose"
  type        = string
}

variable "business_application"{
  description = "Business Application for the tagging purpose"
  type        = string
}