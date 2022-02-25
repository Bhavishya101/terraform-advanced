variable "create_resource_group" {
  description = "Whether to create resource group and use it to create the storage account"
}

variable "resource_group_name" {
  description = "The name of the resource group we want to use"
}

variable "location" {
  description = "Azure location."
}

#---------------------------------------------------------
# Variables for Load Balancer
#----------------------------------------------------------
variable "lb_name" {
  description = "Load Balancer Name"
}

variable "vnet_resource_group" {
  description = "Virtual network resource group name"
}

variable "vnet_name" {
  description = "Virtual network name"
}

variable "vnet_subnet_name" {
  description = "Subnet name"
}

#---------------------------------------------------------
# Variables for Load Balancer Probe
#----------------------------------------------------------
variable "lb_probe_protocol" {
  description = "Protocol to be used for load balancer health probes"
}

variable "lb_probe_port" {
  description = "Port to be used for load balancer health probes"
}

#---------------------------------------------------------
# Variables for Load Balancer Rule
#----------------------------------------------------------
variable "lb_rule_frontend_port" {
  description = "Frontend port to be used for the load balancer rule"
}

variable "lb_rule_backend_port" {
  description = "Backend port to be used for the load balancer rule"
}

#---------------------------------------------------------
# Variables for Load Balancer Backend Pool
#----------------------------------------------------------
variable "backend_pool_VM_Name1" {
  description = "Name of the First VM which needs to be added to the Backend Pool "
  default     = null 
}

variable "backend_pool_VM_Name2" {
  description = "Name of the second VM which needs to be added to the Backend Pool "
  default     = null
}

variable "backend_pool_VM_Name3" {
  description = "Name of the third VM which needs to be added to the Backend Pool "
  default     = null
}

variable "backend_pool_VM_Name4" {
  description = "Name of the fourth VM which needs to be added to the Backend Pool "
  default     = null
}

variable "backend_pool_VM_Name5" {
  description = "Name of the fifth VM which needs to be added to the Backend Pool "
  default     = null
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

variable "request_item_number" {
  description = "Request item number for the tagging purpose"
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