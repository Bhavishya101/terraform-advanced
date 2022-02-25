output "resource_group_name" {
  description = "The name of the resource group in which resources are created"  
  value       = module.sqldatabase.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group in which resources are created"  
  value       = module.sqldatabase.resource_group_location
}

output "primary_sql_server_id" {
  description = "The primary Microsoft SQL Server ID"
  value       = module.sqldatabase.primary_sql_server_id
}

output "primary_sql_server_fqdn" {
  description = "The fully qualified domain name of the primary Azure SQL Server" 
  value       = module.sqldatabase.primary_sql_server_fqdn
}

output "secondary_sql_server_id" {
  description = "The secondary Microsoft SQL Server ID"
  value       = module.sqldatabase.secondary_sql_server_id
}

output "secondary_sql_server_fqdn" {
  description = "The fully qualified domain name of the secondary Azure SQL Server" 
  value       = module.sqldatabase.secondary_sql_server_fqdn
}

output "sql_database_id" {
  description = "The SQL Database ID"
  value       = module.sqldatabase.sql_database_id
}

output "sql_database_name" {
  description = "The SQL Database Name"
  value       = module.sqldatabase.sql_database_name
}

output "sql_failover_group_id" {
  description = "A failover group of databases on a collection of Azure SQL servers."
  value       = module.sqldatabase.sql_failover_group_id
}