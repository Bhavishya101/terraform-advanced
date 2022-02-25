locals {
  datadisk_size_gb = compact([var.Datadisksize_1,var.Datadisksize_2,var.Datadisksize_3,var.Datadisksize_4,var.Datadisksize_5])
  Datadisk_type    = compact([var.Datadisktype_1,var.Datadisktype_2,var.Datadisktype_3,var.Datadisktype_4,var.Datadisktype_5])
  timeout_mins     = "30m"
}

resource "azurerm_managed_disk" "DataDisk" {
  count                  = length(local.datadisk_size_gb)
  name                   = "${var.datadisk_names}-DATA${count.index}"
  location               = var.location
  resource_group_name    = var.resource_group_name
  storage_account_type   = local.Datadisk_type[count.index % length(local.Datadisk_type)]
  create_option          = "Empty"
  disk_size_gb           = local.datadisk_size_gb[count.index % length(local.datadisk_size_gb)]
  disk_encryption_set_id = var.disk_encryption_set_id
  zones                  = var.datadisk_zone
  tags                   = var.tags
  lifecycle {
    ignore_changes= [
      tags,
    ]
  }
  timeouts {
    create = local.timeout_mins
    delete = local.timeout_mins
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "attachdatadisk" {
  count              = length(local.datadisk_size_gb)
  managed_disk_id    = azurerm_managed_disk.DataDisk[count.index % length(azurerm_managed_disk.DataDisk)].id
  virtual_machine_id = var.virtual_machine_id
  lun                = count.index
  caching            = "ReadWrite"
  timeouts {
    create = local.timeout_mins
    delete = local.timeout_mins
  }
}