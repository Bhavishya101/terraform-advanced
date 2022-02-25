output "standalone_instance_fqdn" {
   value = azurerm_sql_managed_instance.SQLMI_Standalone.0.fqdn
   depends_on = [
     azurerm_sql_managed_instance.SQLMI_Standalone,
  ]
}

output "standalone_instance_id" {
   value = azurerm_sql_managed_instance.SQLMI_Standalone.0.id
}

# output "primary_instance_fqdn" {
#    value = azurerm_sql_managed_instance.SQLMI_Primary.0.fqdn
#    depends_on = [azurerm_sql_managed_instance.SQLMI_Primary]
# }

# output "primary_instance_id" {
#    value = azurerm_sql_managed_instance.SQLMI_Primary.0.id
# }

# output "secondary_instance_fqdn" {
#    value = azurerm_sql_managed_instance.SQLMI_Secondary.0.fqdn
# }

# output "secondary_instance_id" {
#    value = azurerm_sql_managed_instance.SQLMI_Secondary.0.id
# }

####

# output "standalone_instance_name" {
#   value = try(
#     jsondecode(azurerm_sql_managed_instance.SQLMI_Standalone.0.output_content).name.value, 
#     null
#   )
# }

# output "standalone_instance_host" {
#    value = try(
#     jsondecode(azurerm_sql_managed_instance.SQLMI_Standalone.0.output_content).host.value, 
#     null
#   )
# }

# output "standalone_instance_principal_id" {
#    value = try(
#     jsondecode(azurerm_sql_managed_instance.SQLMI_Standalone.0.output_content).principal_id.value, 
#     null
#   )
# }

output "primary_instance_name" {
  value = try(
    jsondecode(azurerm_resource_group_template_deployment.SQLMI_Primary.0.output_content).name.value, 
    null
  )
}

output "primary_instance_host" {
   value = try(
    jsondecode(azurerm_resource_group_template_deployment.SQLMI_Primary.0.output_content).host.value, 
    null
  )
}

output "primary_instance_principal_id" {
   value = try(
    jsondecode(azurerm_resource_group_template_deployment.SQLMI_Primary.0.output_content).principal_id.value, 
    null
  )
}

output "secondary_instance_name" {
  value = try(
    jsondecode(azurerm_resource_group_template_deployment.SQLMI_Secondary.0.output_content).name.value, 
    null
  )
}

output "secondary_instance_host" {
   value = try(
    jsondecode(azurerm_resource_group_template_deployment.SQLMI_Secondary.0.output_content).host.value, 
    null
  )
}

output "secondary_instance_principal_id" {
   value = try(
    jsondecode(azurerm_resource_group_template_deployment.SQLMI_Secondary.0.output_content).principal_id.value, 
    null
  )
}