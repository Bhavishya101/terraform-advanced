module "kubernetes" {
  source  = "app.terraform.io/aia_automation/kubernetes/azure"
  version = "1.0.38"
# Azure Foundations 

## Resource Group ##
  create_resource_group   = var.create_resource_group
  resource_group_name     = var.resource_group_name


## AKS ##
  aks_cluster_name        = var.aks_cluster_name
  kubernetes_version      = "1.22.4"
 
  #--node pool--
  node_count              = var.node_count
  vm_size                 = var.vm_size
  os_disk_size_gb         = var.os_disk_size_gb
  os_disk_type            = var.os_disk_type
  node_max_pods           = var.node_max_pods
  node_enable_autoscale   = var.node_enable_autoscale
  node_max_count          =  var.node_max_count
  node_min_count          =  var.node_min_count
  private_cluster_enabled = var.private_cluster_enabled # Only for Unit/SIT
  aad_group_object_id     = var.aad_group_object_id

  #-- networking --
  vnet_name               = var.vnet_name
  vnet_resource_group     = var.vnet_resource_group
  subnet_name             = var.subnet_name
## Kubernetes ##
 
## Tags
  location                = var.location
  environment             = var.environment

#tags = merge(local.common_tags, local.extra_tags)
    #environment           = var.environment
    project_name          = var.project_name
    application_name      = var.application_name
    ibm_imi_managed_env   = var.ibm_imi_managed_env
    business_unit         = var.business_unit
    cost_center           = var.cost_center
    wbs_code              = var.wbs_code       
    server_owner          = var.server_owner
    business_owner        = var.business_owner
    application_service   = var.application_service
    business_application  = var.business_application
    request_item_number   = var.request_item_number
    application_type       = var.application_type  
}
