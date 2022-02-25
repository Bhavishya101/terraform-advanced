#---------------------------------------------------------
# Resource Group Creation
#----------------------------------------------------------
resource "azurerm_resource_group" "resource_group" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group_name)
  location = var.location
  tags     = local.common_tags
  lifecycle {
    ignore_changes                = [
      tags,
    ]
  }
  timeouts {
    create                        = "60m"
    delete                        = "60m"
  }
}

#---------------------------------------------------------
# Failover group - Creation of failovergroup. 
#----------------------------------------------------------

resource "null_resource" "failovergroup" {
  count = local.is_primary ? 1 : 0

  provisioner "local-exec" {
    command = "az login --identity --output none; az sql instance-failover-group create --mi ${var.sqlmi_name} --name ${var.sqlmi_name}-fg --partner-mi ${var.replicaresourcename} --resource-group ${local.resource_group_name} --partner-resource-group ${var.replicaresourcegroup} --subscription ${data.azurerm_client_config.current.subscription_id}"

  }

  depends_on = [time_sleep.primary_wait_30_seconds ]
}

#---------------------------------------------------------
# Wait time added
#---------------------------------------------------------

resource "null_resource" "delay" {
  count = local.is_primary ? 1 : 0

  provisioner "local-exec" {
    command = "sleep 900"
  }

  depends_on = [null_resource.failovergroup]
}

#---------------------------------------------------------
# Enable backup policy for Secondary Server Instance. 
#----------------------------------------------------------

resource "null_resource" "secondaryltrpolicy" {
  count = local.is_primary ? 1 : 0

  provisioner "local-exec" {
	  command = "az login --identity --output none; rg_name=$(az sql mi list --query \"[?name=='${var.replicaresourcename}'].resourceGroup\" -o tsv); az sql midb ltr-policy set -g $rg_name --mi ${var.replicaresourcename} -n ${var.dbname} --weekly-retention ${var.weeklyretention} --monthly-retention ${var.monthlyretention} --yearly-retention ${var.yearlyretention} --week-of-year ${var.weekofyear}"
  }

  depends_on = [null_resource.failovergroup, null_resource.delay]
}