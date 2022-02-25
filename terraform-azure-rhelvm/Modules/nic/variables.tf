variable "nic_name" {
  type = string
}

variable "nic_config_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "enable_accelerated_networking" {
  default = false
}

variable "tags" {
  type = map(string)
}