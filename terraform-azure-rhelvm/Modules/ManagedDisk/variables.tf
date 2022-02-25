variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "virtual_machine_id" {
  type = string
}

variable "datadisk_zone" {
  type = list(number)
}

variable "tags" {
  type = map(string)
}

variable "datadisk_names" {
  type = string
}
variable "disk_encryption_set_id" {}
#variable "encryptionset_name" {}
#variable "key_vault_key_id" {}


# Data Disk Sizes
variable "Datadisksize_1" {}
variable "Datadisksize_2" {}
variable "Datadisksize_3" {}
variable "Datadisksize_4" {}
variable "Datadisksize_5" {}

# Data Disk Types
variable "Datadisktype_1" {}
variable "Datadisktype_2" {}
variable "Datadisktype_3" {}
variable "Datadisktype_4" {}
variable "Datadisktype_5" {}