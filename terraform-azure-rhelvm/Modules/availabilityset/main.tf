resource "azurerm_availability_set" "availability-set" {
  name                = var.availabilityset_name
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = 2
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