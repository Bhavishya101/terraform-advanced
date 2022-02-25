data "azurerm_resource_group" "rg" {
  name = var.resource_group_name

  depends_on = [azurerm_resource_group.new_rg]
}

data "azurerm_shared_image" "linuxsharedimage" {
  provider           = azurerm.GO01
  gallery_name       = "SharedimagegalleryGO"
  name               = var.operatingsystem
  resource_group_name = "rg-go01-eas-p-sharedimage"
}

data "azurerm_key_vault" "keyvault_linux" {
  provider            = azurerm.GO01
  name                = "kv-go01-eas-p-key-vlt01"
  resource_group_name = "rg-go01-eas-p-sharedsrv01-keyvault01"
}

data "azurerm_key_vault_secret" "keyvault_secret" {
  provider     = azurerm.GO01
  name         = "adminPassword"
  key_vault_id = data.azurerm_key_vault.keyvault_linux.id
}

data "azurerm_key_vault_secret" "Ansibletower_token" {
  provider     = azurerm.GO01
  # name         = "at-token"
  name         = var.ansible_tower_env == "uat" ? "TFAPIUAT" : "TFAPIPRD"
  key_vault_id = data.azurerm_key_vault.keyvault_linux.id
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.vnet_resourcegroup_name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = var.vnet_resourcegroup_name
}

data "azurerm_backup_policy_vm" "azurebackup_policy" {
  name                = local.recovery_vault_selected["recoveryvault_policy"]
  resource_group_name = local.recovery_vault_selected["recoveryvault_rg"]
  recovery_vault_name = local.recovery_vault_selected["recoveryvault_name"]
}

# fetch the existing disk encryption based on the Subscription, Region and Environment.
data "azurerm_disk_encryption_set" "encryption_set" {
  #count               = var.custm_mngdkey_encryp_datadisks ? 1 : 0
  name                = local.encryption_set_selected["encryptionset_name"]
  resource_group_name = local.encryption_set_selected["encryptionset_rg"]
}


data "azurerm_subscription" "subs_id" {
}

data "azurerm_availability_set" "av_set" {
  count = var.create_availability_set ? 0 : var.availabilityset_name == "" ? 0 : 1
  name = var.availabilityset_name
  resource_group_name = var.resource_group_name
}