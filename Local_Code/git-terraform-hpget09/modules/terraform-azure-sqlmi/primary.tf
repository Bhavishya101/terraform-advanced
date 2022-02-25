resource "azurerm_sql_managed_instance" "SQLMI_Primary" {
  count				  		   = local.is_primary ? 1 : 0
  depends_on                   = [local.resource_group_name]
  name                         = var.sqlmi_name
  resource_group_name          = local.resource_group_name
  location                     = var.location
  administrator_login          = var.administratorLogin
  administrator_login_password = data.azurerm_key_vault_secret.secret.value
  license_type                 = var.license_type
  subnet_id                    = data.azurerm_subnet.subnet.id
  sku_name                     = "GP_Gen5"
  vcores                       = var.vcore
  storage_size_in_gb           = var.storage_gb
  collation                    = var.collation
  proxy_override               = var.proxyoverride
  timezone_id                  = var.timezone
  public_data_endpoint_enabled = "false"
  tags                         = local.common_tags
  lifecycle {
    ignore_changes             = [
      tags,
    ]
  }
}

resource "azurerm_sql_managed_database" "SQLMI_Primary_Db" {
  count				  	  = local.is_primary ? 1 : 0
  name                    = var.dbname
  sql_managed_instance_id = azurerm_sql_managed_instance.SQLMI_Primary.0.id
  location                = var.location
  depends_on              = [azurerm_sql_managed_instance.SQLMI_Primary]
}

resource "null_resource" "primary_enable_system_identity" {
  count           = local.is_primary ? 1 : 0
  provisioner "local-exec" {
    command = "az login --identity --output none; az sql mi update -g ${local.resource_group_name} -n ${var.sqlmi_name}  -i"
  }  
  depends_on = [azurerm_sql_managed_instance.SQLMI_Primary]
}

resource "null_resource" "primary_get_principal_id" {
  count           = local.is_primary ? 1 : 0
  provisioner "local-exec" {
    command = "az login --identity --output none; az sql mi show -g ${local.resource_group_name} -n ${var.sqlmi_name} --query 'identity.principalId' >> ./modules/terraform-azure-sqlmi/principal.txt"
  }  
  depends_on = [null_resource.primary_enable_system_identity]
}

resource "null_resource" "primary_aad_group_member" {
  count = local.is_primary ? 1 : 0

  provisioner "local-exec" {
    #command = "az login --identity --output none; az ad group member add --group 6820692a-6eda-40be-8c27-a4007d926a97 --member-id ${jsondecode(azurerm_resource_group_template_deployment.SQLMI_Primary.0.output_content).principal_id.value}"
	command = "az login --identity --output none; az ad group member add --group 6820692a-6eda-40be-8c27-a4007d926a97 --member-id ${data.local_file.primary_principalid.content}"
  }
  depends_on = [null_resource.primary_get_principal_id]
}

resource "time_sleep" "primary_wait_30_seconds" {
  count           = local.is_primary ? 1 : 0
  create_duration = "30s"
  depends_on      = [null_resource.primary_aad_group_member]
}

resource "null_resource" "primary_aad_admin" {
  count = local.is_primary ? 1 : 0

  provisioner "local-exec" {
    command = "az login --identity --output none; az sql mi ad-admin create -g ${local.resource_group_name} --mi ${var.sqlmi_name} -u 'AIA-G-Azure-SQLServer' -i f95277aa-ba09-4e04-ad27-c9d0024099ae --subscription ${data.azurerm_client_config.current.subscription_id}"
  }
  
  depends_on = [time_sleep.primary_wait_30_seconds]
}