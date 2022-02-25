resource "azurerm_linux_virtual_machine" "LinuxVM" {
  name                  = var.name
  location              = var.location
  availability_set_id   = var.availability_set_id
  resource_group_name   = var.resource-group
  network_interface_ids = [var.network_interface-id]
  size                  = var.size
  zone                  = var.zone
  provision_vm_agent    = true

  os_disk {
    caching                = "ReadWrite"
    storage_account_type   = var.osdisk_type
    disk_size_gb           = 128
    name                   = var.osdisk_name
    disk_encryption_set_id = var.disk_encryption_set_id
  }

  boot_diagnostics {
    storage_account_uri = null
  }

  dynamic "identity" {
    for_each = var.identity_required ? ["true"] : []
    content {
      type = "SystemAssigned"
    }
  }

  source_image_id                 = var.source_image_id
  admin_username                  = "azure-admin"
  disable_password_authentication = false
  admin_password                  = var.password
  tags                            = var.tags
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

resource "null_resource" "ansible_playbook" {
  count = var.ansible_workflow ? 1 : 0
  provisioner "local-exec" {
    command = "awx -k workflow_job_templates launch ${var.worksflow_job_template} --conf.token  ${var.ansibletower_token} --conf.host ${var.ansible_tower}  --limit ${var.name} --monitor -f human --filter status --inventory ${var.inventory_id} --credential ${var.credential_id} --extra_vars '${local.extra_vars}'"
  }  
  depends_on = [
    azurerm_linux_virtual_machine.LinuxVM
  ]
}