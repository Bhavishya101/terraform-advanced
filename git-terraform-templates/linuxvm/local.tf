locals {
  common_tags = {
    ibm_imi_managed              = var.ibm_imi_managed
    ibm_imi_managedservices_tier = "enterprise"
    AppMSPName                   = "Infra provisioning"
    ServerRole                   = "Redhat-LinuxVM"
  }
  extra_tags = {
    Environment                  = var.ibm_imi_managed_env_map[upper(var.environment)]
    ProjectName                  = var.project_name
    ApplicationName              = var.application_name
    ApplicationType              = var.application_type
    ibm_imi_managed_env          = var.ibm_imi_managed_env
    BusinessUnit                 = substr(var.business_unit,0,2)
    CostCenter                   = var.cost_center
    WBSCode                      = var.wbs_code
    ServerOwner                  = var.server_owner
    RequestItemNumber            = var.request_item_number
    BusinessOwner                = var.business_owner
    ApplicationService           = var.application_service
    BusinessApplication          = var.business_application
    ibm_imi_billing_plan         = var.ibm_imi_billing_plan
  }
}