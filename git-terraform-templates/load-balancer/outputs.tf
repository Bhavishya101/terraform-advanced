output "lb_name" {
  description = "Name of the Load Balancer"
  value       = module.loadbalancer.lb_name
}

output "lb_id" {
  description = "Id of the Load Balancer"
  value       =  module.loadbalancer.lb_id
}

output "lb_private_ip_address" {
  description = "Private IP address of the Load Balancer"
  value       = module.loadbalancer.lb_private_ip_address
}

output "backend_address_pool_id" {
  description = "Id of the associated default backend address pool"
  value       =  module.loadbalancer.backend_address_pool_id
}

output "backend_address_pool_name" {
  description = "Name of the associated default backend address pool"
  value       = module.loadbalancer.backend_address_pool_name
}

output "backend_address_pool_ip_configurations" {
  description = "IP configurations of the associated default backend address pool"
  value       = module.loadbalancer.backend_address_pool_ip_configurations
}

output "backend_address_pool_load_balancing_rules" {
  description = "Load balancing rules of the associated default backend address pool"
  value       = module.loadbalancer.backend_address_pool_load_balancing_rules
}

output "outbound_rule_id" {
  description = "Id of the default outbound rule if any"
  value       = module.loadbalancer.outbound_rule_id
}

output "outbound_rule_name" {
  description = "Name of the default outbound rule if any"
  value       = module.loadbalancer.outbound_rule_name
}