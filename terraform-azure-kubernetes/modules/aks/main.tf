#AKS file
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version  = var.kubernetes_version
  dns_prefix          = var.aks_cluster_name    #Mandatory now in Azure
  
  #-------Private cluster------------
  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = local.private_dns_zone_id  


  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size             = var.vm_size
    os_disk_size_gb     = var.os_disk_size_gb
    os_disk_type        = var.os_disk_type
    type                = var.node_pool_type
    vnet_subnet_id      = var.vnet_subnet_id
    max_pods            = var.node_max_pods
    enable_auto_scaling = var.node_enable_autoscale
    max_count           =  var.node_max_count
    min_count           =  var.node_min_count
    #availability_zones  = lower(var.location) == "southeastasia" ? [1,2,3] : null
    availability_zones  = [1,2,3] 
    tags = var.tags
  }

  linux_profile {
    admin_username = "aksadmin"
    ssh_key {
      key_data = var.ssh_key_data
    }
  }

  network_profile {
    network_plugin = var.net_plugin
    network_policy = var.net_policy

    service_cidr        = var.net_service_cidr
    dns_service_ip      = var.net_dns_service_ip
    docker_bridge_cidr  = var.net_docker_bridge_cidr
    load_balancer_sku   = "Standard"
    outbound_type       = "userDefinedRouting"
  }

  identity {
    type = "UserAssigned"
    user_assigned_identity_id = var.msi_string
  }
  
  role_based_access_control {
    enabled = true
  } 

  addon_profile {
    oms_agent {
      enabled = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }
  tags = var.tags 
  lifecycle {
    ignore_changes= [
      tags,
    ]
  }

}
