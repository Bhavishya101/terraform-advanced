#--------------------------------------------------------
# Local Declarations
#--------------------------------------------------------
locals {

  resource_group_name            = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.resource_group.*.name, [""]), 0)
  dnsZonePartner                 = "${data.azurerm_subscription.subs_info.id}/resourcegroups/${var.replicaresourcegroup}/providers/Microsoft.sql/managedInstances/${var.replicaresourcename}"
  diagnosticSettingsName         = format("%s%s", "Diag_", var.sqlmi_name)
  tenantId                       = "7f2c1900-9fd4-4b89-91d3-79a649996f0a"
  environment                    = var.environment == "P" ? "p" : (var.environment == "R" ? "r" : "n")
  is_standalone                  = var.deployment_mode == "Standalone"
  is_primary                     = var.deployment_mode == "Replication" && var.server_type == "Primary"
  is_secondary                   = var.deployment_mode == "Replication" && var.server_type == "Secondary"
  
#---------------------------------------------------------
# Keyvault Variables
#---------------------------------------------------------

 encryptionKeyvaultName          = element(lookup(var.keyvault,lower(format("%s-%s",var.subscription,local.environment))),1)
 encryptionKeyvaultResourcegroup = element(lookup(var.keyvault,lower(format("%s-%s",var.subscription,local.environment))),0)
 encryptionKeyName               = element(lookup(var.keyvault,lower(format("%s-%s",var.subscription,local.environment))),2)
 encryptionKeyVersion            = data.azurerm_key_vault_key.key_encryption.version
 keyvaulturi                     = join(".", ["${local.encryptionKeyvaultName}","vault.azure.net/keys"])
 #url                             = join(", " ["https://",])   # https://kv-go02-eas-n-sql-vlt01.vault.azure.net:443/keys/key-go02-n-sqltde-key01/86ed9aea44f34e738472816ed968833a
 url                             = join("/", ["https:/","${local.keyvaulturi}","${local.encryptionKeyName}","${local.encryptionKeyVersion}"])
 
  common_tags = {
    ibm_imi_managed              = var.ibm_imi_managed
    ibm_imi_managedservices_tier = "enterprise"
    AppMSPName                   = "PoC infra provisioning"
    ServerRole                   = "SQL MI"
    ApplicationType              = "SQL MI Server"
    Environment                  = var.environment
    ProjectName                  = var.project_name
    ApplicationName              = var.application_name
    ibm_imi_managed_env          = var.ibm_imi_managed_env
    #BusinessUnit                 = var.business_unit
    BusinessUnit                 = substr(var.business_unit,0,2)
    CostCenter                   = var.cost_center 
    WBSCode                      = var.wbs_code
    ServerOwner                  = var.server_owner
    BusinessOwner                = var.business_owner
    ApplicationService           = var.application_service
    BusinessApplication          = var.business_application
    RequestItemNumber            = var.request_item_number
  }

  audit_storage_account          = lookup(var.storageaccount_audit, upper(var.subscription))
}

