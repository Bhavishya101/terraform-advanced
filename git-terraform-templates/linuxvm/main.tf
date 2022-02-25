module "linuxvm" {
  source  = "app.terraform.io/aia_automation/rhelvm/azure"
  version = "1.2.67"
  ########Virtual Machine configuration###############
  create_resource_group   = var.create_resource_group
  resource_group_name     = var.resource_group_name
  availability_zone       = var.availability_zone
  zone                    = var.zone
  create_availability_set = var.create_availability_set
  availabilityset_name    = var.availabilityset_name
  region                  = var.region
  vm_name                 = var.vm_name
  operatingsystem         = var.operatingsystem
  vm_size                 = var.vm_size
  osdisk_type             = var.osdisk_type
  datadisks_required      = var.datadisks_required
  #Datadisk_type           = var.Datadisk_type
  #datadisk_size_gb              = var.datadisk_size_gb
  enable_accelerated_networking = var.enable_accelerated_networking
  systemidentity_required       = var.systemidentity_required
  subscription                  = var.subscription
  custm_mngdkey_encryp_datadisks = var.custm_mngdkey_encryp_datadisks
  environment         = var.environment
  Datadisksize_1      = var.datadisksize_1
  Datadisksize_2      = var.datadisksize_2
  Datadisksize_3      = var.datadisksize_3
  Datadisksize_4      = var.datadisksize_4
  Datadisksize_5      = var.datadisksize_5
  Datadisktype_1      = var.datadisktype_1
  Datadisktype_2      = var.datadisktype_2
  Datadisktype_3      = var.datadisktype_3
  Datadisktype_4      = var.datadisktype_4
  Datadisktype_5      = var.datadisktype_5

  ########Network Configuration#######################
  vnet_name               = var.vnet_name
  vnet_resourcegroup_name = var.vnet_resourcegroup_name
  subnet_name             = var.subnet_name
    
  #########Virtual Machine autoshutdown&start###############
  enable_vm_auto_shutdown_start = var.enable_vm_auto_shutdown_start

  #############Ansible Tower Configuration#############
  ansible_tower_env   = var.ansible_tower_env
  service_now_env     = var.service_now_env
  
  tags = merge( local.common_tags, local.extra_tags)
}