resource "azurerm_backup_protected_vm" "protected_vm" {
  resource_group_name = var.backup_resourcegroup
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = var.source_vm_id
  backup_policy_id    = var.backup_policy_id
  tags                = var.tags
  lifecycle {
    ignore_changes= [
      tags,
    ]
  }
  timeouts {
    create = "30m"
    delete = "30m"
  }
}