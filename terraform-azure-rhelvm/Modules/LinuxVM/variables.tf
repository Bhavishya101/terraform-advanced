variable "location" {
  type = string
}

variable "name" {
  type = string
}

variable "resource-group" {
  type = string
}

variable "network_interface-id" {
  type = string
}

variable "size" {
  type = string
}

variable "password" {
  type = string
  sensitive = true
}

variable "availability_set_id" {
  type = any
}

variable "zone" {
  type = number
}

variable "osdisk_type" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "source_image_id" {}

variable "identity_required" {}

variable "osdisk_name" {
  type = string
}

variable "ansibletower_token" {
  sensitive = true
}

variable "disk_encryption_set_id" {}

variable "inventory_id" {}

variable "credential_id" {}

variable "ansible_tower" {}

variable "ansible_workflow" {}

variable "worksflow_job_template" {}

variable "subscription" {}

variable "service_now_env" {}

variable "request_item_number" {}

locals {
  extra_vars = jsonencode(
    {
      "promt_az_subscription": "${var.subscription}",
      "vmlist": "${var.name}",
      "vm_hostname": "${var.name}",
      "vm_ip": "${azurerm_linux_virtual_machine.LinuxVM.private_ip_address}",
      "request_item_number": "${var.request_item_number}",
      "service_now_env": "${var.service_now_env}"
    }
  )
}