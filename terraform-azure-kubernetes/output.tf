# --- Azure Foundation ###

### Networking ###
output "subnet_id" {
  value = data.azurerm_subnet.subnet_details.id
}

### Resource Groups ###
output "rg_name" {
    value = local.resource_group_name
}

### AzureRM K8S (AKS) ###
output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "log_analytics_workspace_id" {
  value = data.azurerm_log_analytics_workspace.log_an_wkspc_id.id
}

output "subscription_name" {
  value = data.azurerm_subscription.subs_info.display_name
}

output "subscription_id" {
  value = data.azurerm_subscription.subs_info.id
}

# output "aad_group" {
#   value = data.azuread_group.aad_group.id
# }

output "msi_string" {
  value = local.msi_string
}