# Resource group creation
resource "azurerm_resource_group" "new_rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.region
  tags     = var.tags
}

# Availability Set
module "availability_set" {
  source               = "./Modules/availabilityset"
  count                = var.create_availability_set ? 1 : 0
  availabilityset_name = var.availabilityset_name
  #location             = data.azurerm_resource_group.rg.location
  location             = var.region
  resource_group_name  = data.azurerm_resource_group.rg.name
  tags                 = var.tags
}

# Network Interface card
module "network_interface" {
  source                        = "./Modules/nic"
  nic_name                      = "${var.vm_name}-NIC01"
  nic_config_name               = "${var.vm_name}-IPCONFIG1"
  #location                      = data.azurerm_resource_group.rg.location
  location                      = var.region
  resource_group_name           = data.azurerm_resource_group.rg.name
  subnet_id                     = data.azurerm_subnet.subnet.id
  enable_accelerated_networking = var.enable_accelerated_networking
  tags                          = var.tags
}

# Linux Virtual Machine
module "Linux_VM" {
  source               = "./Modules/LinuxVM"
  #location             = data.azurerm_resource_group.rg.location
  location               = var.region
  name                   = var.vm_name
  resource-group         = data.azurerm_resource_group.rg.name
  network_interface-id   = module.network_interface.network_interface_id
  size                   = var.vm_size
  source_image_id        = data.azurerm_shared_image.linuxsharedimage.id
  osdisk_name            = "${var.vm_name}-OSDisk"
  password               = data.azurerm_key_vault_secret.keyvault_secret.value
  osdisk_type            = var.osdisk_type
  # disk_encryption_set_id = var.custm_mngdkey_encryp_datadisks ? azurerm_disk_encryption_set.encryption_set.0.id : null
  #disk_encryption_set_id = var.custm_mngdkey_encryp_datadisks ? data.azurerm_disk_encryption_set.encryption_set.0.id : null
  disk_encryption_set_id = data.azurerm_disk_encryption_set.encryption_set.id
  availability_set_id    = local.av_set_id
  zone                   = var.availability_zone ? var.zone : null
  identity_required      = var.systemidentity_required
  ansibletower_token     = data.azurerm_key_vault_secret.Ansibletower_token.value
  ansible_tower          = local.ansible_tower
  ansible_workflow       = var.ansible_workflow
  worksflow_job_template = local.worksflow_job_template
  inventory_id           = local.inventory_id
  credential_id          = local.credential_id
  subscription           = var.subscription
  service_now_env        = var.service_now_env
  request_item_number    = var.tags["RequestItemNumber"]
  tags                   = var.tags
}

# resource "azurerm_disk_encryption_set" "encryption_set" {
#   count               = var.custm_mngdkey_encryp_datadisks ? 1 : 0
#   name                = "${var.vm_name}-Encryptionset"
#   resource_group_name = var.resource_group_name
#   location            = var.region
#   key_vault_key_id    = data.azurerm_key_vault_key.managedkey_secret.0.id
#   tags                = var.tags
  
#   identity {
#     type = "SystemAssigned"
#   }
# }

# resource "azurerm_key_vault_access_policy" "accesspolicy" {
#   count              = var.custm_mngdkey_encryp_datadisks ? 1 : 0
#   key_vault_id       = data.azurerm_key_vault.managedkey_vault.0.id
#   tenant_id          = azurerm_disk_encryption_set.encryption_set.0.identity.0.tenant_id
#   object_id          = azurerm_disk_encryption_set.encryption_set.0.identity.0.principal_id
  
#   key_permissions = [
#     "Get",
#     "WrapKey",
#     "UnwrapKey"
#   ]
# }

# Data disks for a VM with encryption
module "managed_disk" {
  source                 = "./Modules/ManagedDisk"
  count                  = var.datadisks_required ? 1 : 0
  datadisk_names         = var.vm_name
  location               = var.region
  resource_group_name    = data.azurerm_resource_group.rg.name
  #datadisk_size_gb    = var.datadisk_size_gb
  #Datadisk_type       = var.Datadisk_type
  virtual_machine_id     = module.Linux_VM.linux_vm-id 
  #disk_encryption_set_id = var.custm_mngdkey_encryp_datadisks ? data.azurerm_disk_encryption_set.encryption_set.0.id : null
  disk_encryption_set_id = data.azurerm_disk_encryption_set.encryption_set.id
  datadisk_zone          = var.availability_zone ? [var.zone] : null
  Datadisksize_1         = var.Datadisksize_1
  Datadisksize_2         = var.Datadisksize_2
  Datadisksize_3         = var.Datadisksize_3
  Datadisksize_4         = var.Datadisksize_4
  Datadisksize_5         = var.Datadisksize_5
  Datadisktype_1         = var.Datadisktype_1
  Datadisktype_2         = var.Datadisktype_2
  Datadisktype_3         = var.Datadisktype_3
  Datadisktype_4         = var.Datadisktype_4
  Datadisktype_5         = var.Datadisktype_5
  tags                   = var.tags
}

#Enabling backup on a Virtual Machine.
module "VMbackup" {
  source               = "./Modules/backup"
  count                = var.enable_backup ? 1 : 0
  backup_resourcegroup = local.recovery_vault_selected["recoveryvault_rg"]
  source_vm_id         = module.Linux_VM.linux_vm-id
  recovery_vault_name  = local.recovery_vault_selected["recoveryvault_name"]
  backup_policy_id     = data.azurerm_backup_policy_vm.azurebackup_policy.id
  tags                 = var.tags
}


#Configuring Virtual machine auto-shutdown and auto-start
module "auto_shutdown" {
  source                     = "./Modules/autoshutdown&start"
  count                      = var.enable_vm_auto_shutdown_start ? 1 : 0
  autoshutdown_schedule_name = "${var.vm_name}-autostop-schedule"
  autostart_schedule_name    = "${var.vm_name}-autostart-schedule"
  autostopstart_timezone     = var.timezone_map[upper(var.subscription)]
  vm_name                    = var.vm_name
  
  subscription_id            = data.azurerm_subscription.subs_id.id
  automationacc_rg           = local.automation_account_selected["autoaccount_rg"]
  automationacc_name         = local.automation_account_selected["autoaccount_name"]
  autorunbook_name           = local.automation_account_selected["autoaccount_rbook"]
  tags                       = var.tags
  depends_on                 = [data.azurerm_subscription.subs_id]
}

