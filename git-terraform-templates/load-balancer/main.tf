#--------------------------------------------------------
# Load Balancer Creation Module
#--------------------------------------------------------
module "loadbalancer" {
  source  		                  = "app.terraform.io/aia_automation/loadbalancer/azure"
  version                       = "0.0.31"
  application_name  	          = var.application_name
  application_service             = var.application_service
  business_application            = var.business_application
  business_owner 	              = var.business_owner
  business_unit 	              = var.business_unit
  cost_center 		              = var.cost_center
  create_resource_group           = var.create_resource_group
  environment                     = var.environment
  ibm_imi_managed_env 	          = var.ibm_imi_managed_env
  lb_name 		                  = var.lb_name
  location 		                  = var.location
  project_name 		              = var.project_name
  resource_group_name 	          = var.resource_group_name
  server_owner                    = var.server_owner
  wbs_code 		                  = var.wbs_code
  vnet_resource_group             = var.vnet_resource_group
  vnet_name                       = var.vnet_name
  vnet_subnet_name                = var.vnet_subnet_name
  lb_probe_port                   = var.lb_probe_port
  lb_probe_protocol               = var.lb_probe_protocol
  backend_pool_VM_Name1           = var.backend_pool_VM_Name1
  backend_pool_VM_Name2           = var.backend_pool_VM_Name2
  backend_pool_VM_Name3           = var.backend_pool_VM_Name3
  backend_pool_VM_Name4           = var.backend_pool_VM_Name4
  backend_pool_VM_Name5           = var.backend_pool_VM_Name5
  lb_rule_backend_port            = var.lb_rule_backend_port
  lb_rule_frontend_port           = var.lb_rule_frontend_port
  request_item_number             = var.request_item_number
}