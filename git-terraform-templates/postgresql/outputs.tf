output "resource_group_name" {
    description = "Name of the resource group in which resource is created"
    value       = module.postgresql.resource_group_name
}

output "postgresql_name" {
    description = "Name of the postgresql server."
    value       = module.postgresql.postgresql_name
}

output "posgressql_location" {
    description = "Location where the primary posgres SQL Server is created"
    value       = module.postgresql.posgressql_location
}

output "postgresql_id" {
    description = "The ID of the PostgreSQL Server."
    value       = module.postgresql.postgresql_id
}

output "postgresql_replica_name" {
    description = "Name of the postgresql server replica."
    value       = module.postgresql.postgresql_replica_name
}

output "posgressql_replica_location" {
    description = "Location where the replica posgres SQL Server is created"
    value       = module.postgresql.posgressql_replica_location
}

output "postgresql_replica_id" {
    description = "The ID of the PostgreSQL Server replica."
    value       = module.postgresql.postgresql_replica_id
}

output "login_id" {
    description = "Login name of the Postgresql server."
    value       = module.postgresql.login_id
    sensitive   = true
}