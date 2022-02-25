variable "recovery_vault_name" {
  type = string
}

variable "source_vm_id" {
  type = string
}

variable "backup_policy_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "backup_resourcegroup" {
  type = string
}