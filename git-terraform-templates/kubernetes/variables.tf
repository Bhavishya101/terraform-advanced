# Azure Foundations 

## Resource Group ##
variable "create_resource_group" {
    type = bool
}

variable "resource_group_name" {
}

variable "aks_cluster_name" {
}

# variable "kubernetes_version" {
# }

variable "node_count" {
  type = number
}

variable "vm_size" {
}

variable "os_disk_size_gb" {
  type = number
}

variable "os_disk_type" {
  type    = string
  default = "Ephemeral"
}

variable "node_max_pods" {
  type = number
}

#make it variables
variable "node_enable_autoscale" {
  type = bool
       
}
    
variable "node_max_count" {
  type = number
}

variable "node_min_count" {
  type = number
}


# Networking  ----------------------------
## vnet
variable  vnet_name {
}

## vnet_resource_group **
variable vnet_resource_group {}


## subnet
variable  subnet_name {
}

## Tags
variable "location" {
}

variable "environment" {
}

variable "project_name" {
  default = "Test Project"
}

variable "application_name" {
  default = "Test Application"
}

variable "application_type" {
  default = "Azure PaaS- AKS"
}

# ------ Other Tags ---------------
variable "ibm_imi_managed_env" {
}

variable "business_unit" {
}

variable "cost_center" {
}

variable "wbs_code" {
  default = ""
}

variable "server_owner" {
}

variable "business_owner" {
}
variable "application_service" {
}
variable "business_application" {
}

variable "subscription" {
  default = null
}

variable "request_item_number" {}

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

variable "ibm_imi_managed" {
  default = "No"
}

variable "private_cluster_enabled" {
  default = true
} # only for Unit/SIT

variable "aad_group_object_id" {
  default = "cd03c2eb-2f8a-4408-a607-7b358daec545"
} # only for Unit/SIT since with AD group enabled unable to delete resource