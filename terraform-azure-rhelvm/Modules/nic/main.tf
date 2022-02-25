resource "azurerm_network_interface" "nic" {
  name                          = var.nic_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = var.enable_accelerated_networking
  tags                          = var.tags

  ip_configuration {
    name                          = var.nic_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

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