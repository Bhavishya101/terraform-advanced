# --- Azure Foundation ---  
### Networking ###

data "azurerm_subnet" "subnet_details" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group
}

### Resource Groups ###
data "azurerm_resource_group" "rg_exists" {
  count = var.create_resource_group ? 0 : 1
  name = var.resource_group_name
  depends_on = [module.foundation.rg]
}

### AzureRM K8S (AKS) ###
data "azurerm_subscription" "subs_info" {
}


data "azurerm_log_analytics_workspace" "log_an_wkspc_id" {
  #Using a map:
  name = local.log_an_workspace_sel["logan_ws_name"]
  resource_group_name = local.log_an_workspace_sel["logan_rg"]
}

# data "azuread_group" "aad_group" {
#   display_name     = "AIA-G-Azure-CCOE"
# }

data "azurerm_key_vault" "keyvault_linux" {
  provider            = azurerm.GO01
  name                = "kv-go01-eas-p-key-vlt01"
  resource_group_name = "rg-go01-eas-p-sharedsrv01-keyvault01"
}

data "azurerm_key_vault_secret" "keyvault_secret" {
  provider     = azurerm.GO01
  name         = "akspsshRSAPublicKey"
  key_vault_id = data.azurerm_key_vault.keyvault_linux.id
}