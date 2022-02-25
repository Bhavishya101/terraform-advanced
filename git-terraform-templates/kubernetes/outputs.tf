# --- Azure Foundation ###

### Networking ###
output "subnet_id" {
  value = module.kubernetes.subnet_id
}

### Resource Groups ###
output "rg_name" {
  value = module.kubernetes.rg_name
}

### AzureRM K8S (AKS) ###
output "aks_cluster_name" {
  value = module.kubernetes.aks_cluster_name
}

output "log_analytics_workspace_id" {
  value = module.kubernetes.log_analytics_workspace_id
}

output "subscription_name" {
  value = module.kubernetes.subscription_name
}

output "subscription_id" {
  value = module.kubernetes.subscription_id
}

output "msi_string" {
  value = module.kubernetes.msi_string
}