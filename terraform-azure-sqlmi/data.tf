#---------------------------------------------------------
# Resource Group Creation or selection
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count               = var.create_resource_group == false ? 1 : 0
  name                = var.resource_group_name
}

# data "azurerm_resource_group" "rgrp_sec" {
#   count               = var.create_secondary_resource_group == false ? 1 : 0
#   name                = var.secondary_resource_group_name
# }

# data "null_data_source" "key_url" {
#     inputs = {
#       main_url = "https://${local.encryptionKeyvaultName}.vault.azure.net/keys/${local.encryptionKeyName}/${local.encryptionKeyVersion}"                             # https://kv-go02-eas-n-sql-vlt01.vault.azure.net:443/keys/key-go02-n-sqltde-key01/86ed9aea44f34e738472816ed968833a
#     }
# }

data "azurerm_resource_group" "keyvaultRG" {
  provider           = azurerm.GO01
  name     = var.resource_group_name_keyvault
}

data "azurerm_key_vault" "keyvault" {
  provider           = azurerm.GO01
  name                = var.keyvault_name
  resource_group_name = data.azurerm_resource_group.keyvaultRG.name
}


data "azurerm_key_vault_secret" "secret" {
  provider           = azurerm.GO01
  name         = var.keyvault_secret
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_resource_group" "VNET" {
  name     = var.vnet_resource_group
}

data "azurerm_virtual_network" "virtualnetwork" {
  name = var.vnet_name
  resource_group_name = data.azurerm_resource_group.VNET.name
}

data "azurerm_subnet" "subnet"{
  name = var.vnet_subnet_name
  resource_group_name = data.azurerm_resource_group.VNET.name
  virtual_network_name = data.azurerm_virtual_network.virtualnetwork.name
}

#---------------------------------------------------------
# Fetch the client configs - Tenant ID. 
#----------------------------------------------------------

data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "subs_info" {
}

#---------------------------------------------------------
# Key Vault Details for Custom Data Encryption 
#----------------------------------------------------------
data "azurerm_key_vault" "key_vault_encryption" {
  name                    = element(lookup(var.keyvault,lower(format("%s-%s",var.subscription,local.environment))),1)
  resource_group_name     = element(lookup(var.keyvault,lower(format("%s-%s",var.subscription,local.environment))),0)
}

data "azurerm_key_vault_key" "key_encryption" {
  name                    = element(lookup(var.keyvault,lower(format("%s-%s",var.subscription,local.environment))),2)
  key_vault_id            = data.azurerm_key_vault.key_vault_encryption.id
}

#---------------------------------------------------------
# Fetch the Principal ID of SQL Mi Instance into File
#----------------------------------------------------------

# data "local_file" "standalone_principalid" {
#   #filename = "./modules/terraform-azure-sqlmi/principal.txt"
#   filename = "./principal.txt"
#   depends_on = [null_resource.standalone_get_principal_id]
# }

# data "local_file" "primary_principalid" {
#   filename = "./modules/terraform-azure-sqlmi/principal.txt"
#   depends_on = [null_resource.primary_get_principal_id]
# }

# data "local_file" "secondary_principalid" {
#   filename = "./modules/terraform-azure-sqlmi/principal.txt"
#   depends_on = [null_resource.secondary_get_principal_id]
# }

data "azurerm_storage_account" "audit" {
  name                    = element(lookup(local.audit_storage_account,var.location),1)
  resource_group_name     = element(lookup(local.audit_storage_account,var.location),0)
}
