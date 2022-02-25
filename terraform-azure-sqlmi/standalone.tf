resource "azurerm_resource_group_template_deployment" "SQLMI_Standalone" {
  count				  = local.is_standalone ? 1 : 0
  depends_on          = [local.resource_group_name]
  name                = var.sqlmi_name
  resource_group_name = local.resource_group_name
  deployment_mode     = "Incremental"
  		
  template_content = <<TEMPLATE

{
	"$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
	"contentVersion": "1.0.0.1",
	"parameters": {
		"administratorLogin": {
			"type": "string"
		},
		"administratorLoginPassword": {
			"type": "securestring"
		},
		"location": {
			"type": "string"
		},
		"managedInstanceName": {
			"type": "string"
		},
		"virtualNetworkName": {
			"type": "string"
		},
		"subnetName": {
			"type": "string"
		},
		"rgvirtualNetwork": {
			"type": "string"
		},
		"skuName": {
			"type": "string"
		},
		"skuEdition": {
			"type": "string"
		},
		"proxyOverride": {
			"type": "string"
		},
		"timezone": {
			"type": "string"
		},
		"collation": {
			"type": "string",
			"defaultValue": "SQL_Latin1_General_CP1_CI_AS"
		},
		"vCores": {
			"type": "string"
		},
		"storageSizeInGB": {
			"type": "string"
		},
		"licenseType": {
			"type": "string"
		},
		"dbName": {
			"type": "string"
		},
		"retentionDays": {
			"type": "string"
		},
		"resourceTags":{
			"type": "object"
		},
		"settingName": {
			"type": "string"
		},
		"storageAccountId": {
			"type": "string"
		},
		"environment": {
			"type": "string"
		},
		"encryptionKeyvaultName": {
			"type": "string"
		},
		"encryptionKeyvaultResourcegroup": {
			"type": "string"
		},
		"encryptionKeyName": {
			"type": "string"
		},
		"encryptionKeyVersion": {
			"type": "string"
		},
		"tenantId": {
			"type": "string"
		}
	},
	"variables": {
		"vCores": "[int(parameters('vCores'))]",
		"storageSizeInGB": "[int(parameters('storageSizeInGB'))]",
		"sqlServerKeyName": "[concat(parameters('encryptionKeyvaultName'), '_', parameters('encryptionKeyName'), '_', parameters('encryptionKeyVersion'))]"
	},
	"resources": [{
			"apiVersion": "2015-05-01-preview",
			"type": "Microsoft.Sql/managedInstances",
			"identity": {
				"type": "SystemAssigned"
			},
			"location": "[parameters('location')]",
			"name": "[parameters('managedInstanceName')]",
			"tags": "[parameters('resourceTags')]",
			"sku": {
				"name": "[parameters('skuName')]",
				"tier": "[parameters('skuEdition')]"
			},
			"properties": {
				"administratorLogin": "[parameters('administratorLogin')]",
				"administratorLoginPassword": "[parameters('administratorLoginPassword')]",
				"subnetId": "[resourceId(parameters('rgvirtualNetwork'),'Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworkName'), parameters('subnetName'))]",
				"storageSizeInGB": "[variables('storageSizeInGB')]",
				"vCores": "[variables('vCores')]",
				"licenseType": "[parameters('licenseType')]",
				"timezoneId": "[parameters('timezone')]",
				"collation": "[parameters('collation')]",
				"proxyOverride": "[parameters('proxyOverride')]",
				"publicDataEndpointEnabled": false,
				"minimalTlsVersion": "1.2",
				"storageAccountType": "GRS",
				"zoneRedundant": false
			}
		},
		{
			"type": "Microsoft.Sql/managedInstances/databases",
			"apiVersion": "2020-11-01-preview",
			"name": "[concat(parameters('managedInstanceName'), '/', parameters('dbName'))]",
			"location": "[parameters('location')]",
			"dependsOn": [
				"[resourceId('Microsoft.Sql/managedInstances', parameters('managedInstanceName'))]"
			],
			"properties": {
				"collation": "SQL_Latin1_General_CP1_CI_AS"
			}
		},
		{
			"type": "Microsoft.Sql/managedInstances/databases/backupShortTermRetentionPolicies",
			"apiVersion": "2020-11-01-preview",
			"name": "[concat(parameters('managedInstanceName'), '/', parameters('dbName'),'/default')]",
			"location": "[parameters('location')]",
			"dependsOn": [
				"[resourceId('Microsoft.Sql/managedInstances/databases', parameters('managedInstanceName'), parameters('dbName'))]",
				"[resourceId('Microsoft.Sql/managedInstances', parameters('managedInstanceName'))]"
			],
			"properties": {
				"retentionDays": "[int(parameters('retentionDays'))]"
			}
		},

		{
			"type": "Microsoft.Sql/managedInstances/databases/backupLongTermRetentionPolicies",
			"apiVersion": "2020-11-01-preview",
			"name": "[concat(parameters('managedInstanceName'), '/', parameters('dbName'),'/default')]",
			"location": "[parameters('location')]",
			"dependsOn": [
				"[resourceId('Microsoft.Sql/managedInstances/databases', parameters('managedInstanceName'), parameters('dbName'))]",
				"[resourceId('Microsoft.Sql/managedInstances', parameters('managedInstanceName'))]"
			],
			"properties": {
				"weeklyRetention": "P6W",
				"monthlyRetention": "P13M",
				"yearlyRetention": "P10Y",
				"weekOfYear": 1
			}
		},
		{
            "type": "Microsoft.Sql/managedInstances/providers/diagnosticSettings",
            "apiVersion": "2017-05-01-preview",
			"name": "[concat(parameters('managedInstanceName'), '/microsoft.insights/', parameters('settingName'))]",
			"location": "[parameters('location')]",
			"dependsOn": [
				"[resourceId('Microsoft.Sql/managedInstances', parameters('managedInstanceName'))]"
			],
            "properties": {
				"storageAccountId": "[parameters('storageAccountId')]",
                "logs": [
                    {
                        "category": "ResourceUsageStats",
                        "enabled": true,
						"retentionPolicy": {
							"days": 91,
							"enabled": true
						}
                    },
                    {
                        "category": "DevOpsOperationsAudit",
                        "enabled": true,
						"retentionPolicy": {
							"days": 91,
							"enabled": true
						}
                    },
                    {
                       "category": "SQLSecurityAuditEvents",
                        "enabled": true,
						"retentionPolicy": {
							"days": 91,
							"enabled": true
						}
                    }
                ]
            }
		},
    	{
      		"type": "Microsoft.Resources/deployments",
      		"apiVersion": "2020-06-01",
      		"name": "addAccessPolicy",
      		"resourceGroup": "[parameters('encryptionKeyvaultResourcegroup')]",
      		"dependsOn": [
        		"[resourceId('Microsoft.Sql/managedInstances', parameters('managedInstanceName'))]"
      		],
      		"properties": {
        		"mode": "Incremental",
        		"template": {
          			"$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
          			"contentVersion": "1.0.0.0",
          			"resources": [
            			{
              				"type": "Microsoft.KeyVault/vaults/accessPolicies",
              				"name": "[concat(parameters('encryptionKeyvaultName'), '/add')]",
              				"apiVersion": "2019-09-01",
			            	"properties": {
                				"accessPolicies": [
                				  {
                    				"tenantId": "[parameters('tenantId')]",
                    				"objectId": "[reference(resourceId('Microsoft.Sql/managedInstances/', parameters('managedInstanceName')), '2019-06-01-preview', 'Full').identity.principalId]",
                    				"permissions": {
                      					"keys": [
                        					"get",
                        					"wrapKey",
                        					"unwrapKey"
                      					]
                    				}
                  				  }
                				]
              				}
            			}
          			]
        		}
      		}
    	},
		{
			"type": "Microsoft.Sql/managedInstances/databases/vulnerabilityAssessments",
			"apiVersion": "2021-08-01-preview",
  			"name": "default",
			"properties": {
				"recurringScans": {
					"emails": [ "securitytesting@aia.com" ],
					"emailSubscriptionAdmins": "true",
					"isEnabled": "true"
			},
			"storageAccountAccessKey": "string",
			"storageContainerPath": "string",
			"storageContainerSasKey": "string"
			}
		},
		{
			"condition": "[equals(parameters('environment'),'P')]",
            "type": "Microsoft.Sql/managedInstances/encryptionProtector",
            "apiVersion": "2021-02-01-preview",
			"name": "[concat(parameters('managedInstanceName'), '/current')]",
            "dependsOn": [
                "[resourceId('Microsoft.SQL/managedInstances/keys', parameters('managedInstanceName'), variables('sqlServerKeyName'))]"
            ],
			"kind": "azurekeyvault",
            "properties": {
				"serverKeyName": "[variables('sqlServerKeyName')]",
                "serverKeyType": "AzureKeyVault",
                "autoRotationEnabled": false
            }	
		},
		{
			"condition": "[equals(parameters('environment'),'P')]",
            "type": "Microsoft.Sql/managedInstances/keys",
            "apiVersion": "2021-02-01-preview",
            "name": "[concat(parameters('managedInstanceName'), '/', variables('sqlServerKeyName'))]",
            "dependsOn": [
				"addAccessPolicy",
                "[resourceId('Microsoft.Sql/managedInstances', parameters('managedInstanceName'))]"
            ],
            "kind": "azurekeyvault",
            "properties": {
                "serverKeyType": "AzureKeyVault",
                "uri": "[concat(reference(resourceId(parameters('encryptionKeyvaultResourcegroup'), 'Microsoft.KeyVault/vaults/', parameters('encryptionKeyvaultName')), '2018-02-14-preview', 'Full').properties.vaultUri, 'keys/', parameters('encryptionKeyName'), '/', parameters('encryptionKeyVersion'))]"
            }
		}
	],

	"outputs": {
		"name": {
			"type": "string",
			"value": "[parameters('managedInstanceName')]"
		},
		"host": {
			"type": "string",
			"value": "[reference(resourceId('Microsoft.Sql/managedInstances', parameters('managedInstanceName'))).fullyQualifiedDomainName]"
		},
		"principal_id": {
		  "type": "string",
		  "value": "[reference(resourceId('Microsoft.Sql/managedInstances/', parameters('managedInstanceName')), '2019-06-01-preview', 'Full').identity.principalId]"
		}
	}

}


  TEMPLATE

  parameters_content     =  jsonencode({

    "administratorLogin" = {
		value = var.administratorLogin
	}
    "administratorLoginPassword"      = {
	value = data.azurerm_key_vault_secret.secret.value
	}
    "location"                        = {
		value = var.location
	}
    "managedInstanceName" = {
	value = var.sqlmi_name
	}             
    "virtualNetworkName"      = {
	value     = data.azurerm_virtual_network.virtualnetwork.name
	}
    "subnetName"          = {            
	value = data.azurerm_subnet.subnet.name
	}
    "rgvirtualNetwork"                = {
	value = data.azurerm_resource_group.VNET.name
	}
    "skuName"              = {            
	value =            var.sku_name
	}
    "skuEdition"           = {            
	value =            var.skuedition
	}
    "proxyOverride"             = {            
	value =     var.proxyoverride
	}
    "timezone"            = {            
	value =            var.timezone
	}
    "collation"               = {            
	value =       var.collation
	}
    "vCores"           = {            
	value =             var.vcore
	}
    "storageSizeInGB"      = {            
	value =         var.storage_gb
	}
    "licenseType"     = {            
	value =              var.license_type
	}
	"dbname"      = {            
	value =                   var.dbname
	}
	"retentionDays"	= {            
	value =			var.backup_retention_days
	}
	"resourceTags"					= {
		value = local.common_tags
	}
	"settingName" = {
		value = local.diagnosticSettingsName
	}
	"storageAccountId" = {
		value = data.azurerm_storage_account.audit.id
	}
	"environment" = {
		value = var.environment
	}
	"encryptionKeyvaultName" = {
		value = local.encryptionKeyvaultName
	}
	"encryptionKeyvaultResourcegroup" = {
		value = local.encryptionKeyvaultResourcegroup
	}
	"encryptionKeyName" = {
		value = local.encryptionKeyName
	}
	"encryptionKeyVersion" = {
		value = local.encryptionKeyVersion
	}
	"tenantId" = {
		value = local.tenantId
	}
  })

 tags                             = local.common_tags

  timeouts {
    create = "6h"
    delete = "6h"
  }
  
}

#--------------------------------------------------------
# Null Resource to get add AD group memeber
#--------------------------------------------------------

resource "null_resource" "standalone_aad_group_member" {
  count = local.is_standalone ? 1 : 0

  provisioner "local-exec" {
    command = "az login --identity --output none; az ad group member add --group 6820692a-6eda-40be-8c27-a4007d926a97 --member-id ${jsondecode(azurerm_resource_group_template_deployment.SQLMI_Standalone.0.output_content).principal_id.value}"
  }
  depends_on = [azurerm_resource_group_template_deployment.SQLMI_Standalone]
}

resource "time_sleep" "standalone_wait_30_seconds" {
  count           = local.is_standalone ? 1 : 0
  create_duration = "30s"
  depends_on      = [null_resource.standalone_aad_group_member]
}

#--------------------------------------------------------
# Null Resource to get add AD admin member
#--------------------------------------------------------

resource "null_resource" "standalone_aad_admin" {
  count = local.is_standalone ? 1 : 0

  provisioner "local-exec" {
    command = "az login --identity --output none; az sql mi ad-admin create -g ${local.resource_group_name} --mi ${var.sqlmi_name} -u 'AIA-G-Azure-SQLServer' -i f95277aa-ba09-4e04-ad27-c9d0024099ae --subscription ${data.azurerm_client_config.current.subscription_id}"
  }
  
  depends_on = [time_sleep.standalone_wait_30_seconds]
}
