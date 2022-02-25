variable "region" {
  type = string
}


variable "create_resource_group" {}

variable "resource_group_name" {
  type = string
}

variable "availabilityset_name" {
  default = ""
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "operatingsystem" {}

variable "zone" {
  default = null
}

variable "availability_zone" {}

variable "create_availability_set" {}

variable "enable_accelerated_networking" {
  default = false
}

# OS and Data Disks
/*
variable "datadisk_size_gb" {
  type = list(number)
  default = null
}
*/
variable "custm_mngdkey_encryp_datadisks" {}
variable "datadisks_required" {}
/*
variable "Datadisk_type" {
  type = list(string)
  default = null
}
*/
variable "osdisk_type" {
  type = string
}

# Networking
variable "vnet_name" {
  type = string
}

variable "vnet_resourcegroup_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

# Virtual Machine Auto Shutdown Condiguration
variable "enable_vm_auto_shutdown_start" {}

variable "subscription" {}

# System Indentity
variable "systemidentity_required" {}

# Data Disk Sizes
variable "datadisksize_1" {
  default = null
}
variable "datadisksize_2" {
  default = null
}
variable "datadisksize_3" {
  default = null
}
variable "datadisksize_4" {
  default = null
}
variable "datadisksize_5" {
  default = null
}

# Data Disk Types
variable "datadisktype_1" {
  default = null
}
variable "datadisktype_2" {
  default = null
}
variable "datadisktype_3" {
  default = null
}
variable "datadisktype_4" {
  default = null
}
variable "datadisktype_5" {
  default = null
}

variable "ibm_imi_managed_env_map" {
  type = map
  default = {
    P  = "Production System"
    U  = "User Acceptance System/ QA"
    S  = "System Integration System"
    R  = "Disaster Recover System"
    G  = "Regression Test"
    D  = "Development System and Testing"
    N  = "Non-Production System"
  }
}

# Tags of the resource
variable "environment" {}
variable "project_name" {}
variable "application_name" {}
variable "ibm_imi_managed_env" {}
variable "business_unit" {}
variable "cost_center" {}
variable "wbs_code" {}
variable "server_owner" {}
variable "business_owner" {}
variable "application_service" {}
variable "business_application" {}
variable "application_type" {}
variable "request_item_number" {}
variable "ibm_imi_billing_plan" {
  description = "Variable for MSP Billing Plan. Accepted values are hourly or monthly"
  default = "hourly"
}
variable "ibm_imi_managed" {
  default = "Yes"
}
#For ansible  integration
variable "ansible_tower_env" {}
variable "service_now_env" {
  default = "aiatest2"
}