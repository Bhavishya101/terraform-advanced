### Azure Foundation ###

locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rg_exists.*.name, module.foundation.*.rg_name, [""]), 0)
}  

## AKS networking ###

# Old logic to figure out the ip address ranges
/*
locals {
    #net_subnet_address_prefix = module.network.subnet_address_prefixes[0]
    net_subnet_address_prefix = data.azurerm_subnet.subnet_details.address_prefixes[0]
    net_subnet_cidrhost       = cidrhost(local.net_subnet_address_prefix, 0)
    last_octet            = regex("\\.([0-9]{1,3})$", local.net_subnet_cidrhost)
    first_octet           = regex("^[0-9]{1,3}", local.net_subnet_cidrhost)
    net_service_cidr          =join("", ["120", trimprefix(local.net_subnet_address_prefix, local.first_octet)])
    net_dns_service_ip       = join("", ["120", trimprefix(trimsuffix(local.net_subnet_cidrhost, local.last_octet[0]), local.first_octet), tostring(tonumber(local.last_octet[0])+10)])
    net_docker_bridge_cidr    = join("", ["172", trimprefix(local.net_subnet_cidrhost, local.first_octet), "/20"]) 
} 
*/

locals {
  net_service_cidr          = "10.206.80.0/20"
  net_dns_service_ip        = "10.206.80.10"
  net_docker_bridge_cidr    = "10.207.80.1/20"
} 

## Log Analytics Workspace ##

# Log Analytics using mapping

locals {
#  short_region_name = lower(var.location) == "eastasia" ? "eas":"sea"
  eas_region = lower(var.location) == "eastasia" ? "eas":""
  sea_region = lower(var.location) == "southeastasia" ? "sea":""
  aue_region = lower(var.location) == "australiaeast" ? "aue":""
  aus_region = lower(var.location) == "australiasoutheast" ? "aus":""
  #short_region_name = coalescelist([local.eas_region],[local.sea_region],[local.aue_region],[local.aus_region])
  short_region_name = coalesce(local.eas_region,local.sea_region,local.aue_region,local.aus_region)

  #Log Analytics
  log_an_workspace_subs = format("%s_%s", upper(data.azurerm_subscription.subs_info.display_name), local.short_region_name)
  log_an_workspace_sel = var.log_an_workspace[local.log_an_workspace_subs]

  # MSI String
  msi_env = upper(var.environment) == "P" ? "P":"N"
  msi_subs = format("%s_%s_%s", upper(data.azurerm_subscription.subs_info.display_name), local.short_region_name, local.msi_env)
  msi_sel = var.user_msi[local.msi_subs]
  msi_id_name = local.msi_sel["msi_id_name"]
  msi_rg = local.msi_sel["msi_rg"]
  msi_string = "${data.azurerm_subscription.subs_info.id}/resourcegroups/${local.msi_rg}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/${local.msi_id_name}"
}


locals {
 common_tags = {
    Environment = var.ibm_imi_managed_env_map[var.environment]
    ProjectName = var.project_name
    ApplicationName = var.application_name
    ibm_imi_managed_env = var.ibm_imi_managed_env_map[var.ibm_imi_managed_env]
    BusinessUnit = substr(var.business_unit,0,2)
    CostCenter = var.cost_center
    WBSCode = var.wbs_code       
    ServerOwner = var.server_owner
    BusinessOwner = var.business_owner
    ApplicationService = var.application_service
    BusinessApplication = var.business_application
    RequestItemNumber = var.request_item_number
    ibm_imi_managed = var.ibm_imi_managed
    ibm_imi_managedservices_tier = "Enterprise"
    AppMSPName = "PoC infra provisioning"
    ApplicationType = var.application_type  
  }
}