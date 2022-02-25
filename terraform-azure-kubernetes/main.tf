# Main
module "foundation" {
  count = var.create_resource_group ? 1 : 0
  source = "./modules/foundation/"
  resource_group_name = var.resource_group_name
  location = var.location
  tags = local.common_tags
}

module "aks" {
  source = "./modules/aks/"
  resource_group_name = local.resource_group_name
  aks_cluster_name    = var.aks_cluster_name
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  private_cluster_enabled = var.private_cluster_enabled

  ###--node pool--
  node_count      = var.node_count
  vm_size         = var.vm_size
  os_disk_size_gb = var.os_disk_size_gb
  os_disk_type    = var.os_disk_type
  # node_pool_type  = var.node_pool_type
  vnet_subnet_id = data.azurerm_subnet.subnet_details.id
  node_max_pods   = var.node_max_pods
  node_enable_autoscale = var.node_enable_autoscale
  node_max_count       =  var.node_enable_autoscale ? var.node_max_count : null
  node_min_count       =  var.node_enable_autoscale ? var.node_min_count : null

  ###linux_profile
  ssh_key_data = data.azurerm_key_vault_secret.keyvault_secret.value
  
  ###network profile
  net_plugin = var.net_plugin
  net_policy = var.net_policy

  net_service_cidr  = local.net_service_cidr
  net_dns_service_ip = local.net_dns_service_ip
  net_docker_bridge_cidr = local.net_docker_bridge_cidr 

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_an_wkspc_id.id
  msi_string = local.msi_string
  subs_id = data.azurerm_subscription.subs_info.id
  # aad_group_id               = data.azuread_group.aad_group.id
  tags = local.common_tags
  environment = var.environment
   depends_on = [data.azurerm_subnet.subnet_details]
}

module "kubernetes" {
  source = "./modules/kubernetes/"
  environment = var.environment
  depends_on  = [module.aks]
}


resource "null_resource" "aad_integration" {
  provisioner "local-exec" {
    command = "az login --identity --output none; az aks update -g ${var.resource_group_name} -n ${var.aks_cluster_name} --enable-aad --aad-admin-group-object-ids ${var.aad_group_object_id} --subscription ${data.azurerm_subscription.subs_info.subscription_id}"
  }  
  depends_on = [module.kubernetes]
}