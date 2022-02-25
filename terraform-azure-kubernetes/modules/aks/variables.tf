variable location {
}

variable resource_group_name {}

variable aks_cluster_name {}

variable kubernetes_version {
    #default = "1.18.14"
}

variable private_cluster_enabled {
   default = true
}

variable private_dns_zone_ids {
  default = {
    "eastasia" = "/subscriptions/e8569be2-1379-4a99-a535-b2dc6b90757f/resourceGroups/rg-go01-eas-p-sharedsrv01-dns01/providers/Microsoft.Network/privateDnsZones/privatelink.eastasia.azmk8s.io"
    "southeastasia" ="/subscriptions/e8569be2-1379-4a99-a535-b2dc6b90757f/resourceGroups/rg-go01-sea-p-sharedsrv01-dns01/providers/Microsoft.Network/privateDnsZones/privatelink.southeastasia.azmk8s.io"
    "australiaeast" = "/subscriptions/e8569be2-1379-4a99-a535-b2dc6b90757f/resourceGroups/rg-go01-aue-p-sharedsrv01-DNS01/providers/Microsoft.Network/privateDnsZones/privatelink.australiaeast.azmk8s.io"
    "australiasoutheast" = "/subscriptions/e8569be2-1379-4a99-a535-b2dc6b90757f/resourceGroups/rg-go01-aus-p-sharedsrv01-DNS01/providers/Microsoft.Network/privateDnsZones/privatelink.australiasoutheast.azmk8s.io"
  }
}

locals {
  private_dns_zone_id = var.private_dns_zone_ids[var.location]
}
#*/

variable vm_size {}

variable os_disk_size_gb {}

variable os_disk_type {}

variable node_count {}

variable node_pool_type {
    default = "VirtualMachineScaleSets"
}

variable node_max_pods {
  #default = 30
}

variable node_enable_autoscale {
  #default = true        
}
    
variable node_max_count {
  #default =  5
}

variable node_min_count {
  #default =  2
}

## network profile
variable net_plugin {
  #default = "azure"
}

variable net_policy { 
  #default = "azure"
}

variable net_service_cidr {}


variable net_dns_service_ip {}
    
variable net_docker_bridge_cidr {}

variable environment { }
variable vnet_subnet_id {}
variable tags {}
variable log_analytics_workspace_id {}
variable msi_string {}
variable subs_id {}
variable ssh_key_data {}