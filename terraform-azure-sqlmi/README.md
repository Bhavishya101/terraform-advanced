# Azure SQl MI Terraform Module

This Terraform code is developed to automate the creation of the Azure SQL MI in accordance to AIA requirements. These are ofcourse bound by the rules, parameters,limitations, etc set by Azure. For more details please refer to : https://docs.microsoft.com/en-us/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview

As there is no direct module for SQL MI, here the automated deplopyment has been done using the ARM template and deploying the same on Azure using Azurerm_tepmlate_deployment. 

## Module Input Variables
All input variables are mandatory unless mentioned optional

- `create_resource_group`           - Whether to create resource group and use it to create the postgresql.
- `resource_group_name`             - The name of the resource group.
- `location`                        - The location/region where we are creating the resource.
- `managedInstanceName`             - Name of the managed instance server 
- `proxyovverride`                  - Connection type used for connecting to the instance. - Proxy, Redirect, Default
- `timezone`                        - Name of the timezone from the list of MS defined timezones. 
- `vcores`                          - The number of vCores. Allowed values: 8, 16, 24, 32, 40, 64, 80.
- `storage_gb`                      - Storage size in GB. Minimum value: 32. Maximum value: 8192. Increments of 32 GB allowed only.
- `licensetype`                     - LicenseIncluded or BasePrice
- `dbname`

### Optional Variables:

- `ibm_imi_managed_env` - ibm_imi_managed_env for the tagging purpose
- `application_name` - Application name for the tagging purpose
- `application_service` - Application Service for the tagging purpose
- `business_application` - Business Application for the tagging purpose
- `business_owner` - Business Owner for the tagging purpose
- `business_unit` - Business Unit for the tagging purpose
- `cost_center` - Cost Center for the tagging purpose
- `environment` - Environment name for the tagging purpose
- `request_item_number` - Request item number for the tagging purpose. If testing manually pass a value example: "Terraform"
- `project_name` - Project name for the tagging purpose
- `server_owner` - Server Owner for the tagging purpose
- `vnet_resource_group` - Virtual network resource group nam
- `vnet_name` - Virtual network name
- `vnet_subnet_name` - Subnet Name
- `wbs_code` - WBS Code for the tagging purpose          

### Usage

```hcl
    create_resource_group           = false
    resource_group_name				= rg-go02-eas-n-terraform-test
    location                        = eastasia
    managedInstanceName             = sgazrmdb0001
    proxyovverride                  = proxy
    timezone                        = China Standard Time 
    vcores                          = 4
    storage_gb                      = 512
    licensetype                     = LicenseIncluded
    dnsZonePartner                  = NA
    dbname                          = database1
    environment                     = P
    application_name                = SQLMi 
    project_name                    = AIA Terraform
    request_item_number             = RITM00880000
    application_service             = AS
    business_application            = BS
    ibm_imi_managed_env             = P
    server_owner                    = CCOE
    business_unit                   = GO02
    business_owner                  = CCOE
    cost_center                     = WBS
    wbs_code                        = PoC infra provisioning
```

### ARM Template Deployment

- `Microsoft.Sql/managedInstances` - Managed instance deployment. 
- `Microsoft.Sql/managedInstances/databases` - Creation of managed instance database.  
- `Microsoft.Sql/managedInstances/databases/backupLongTermRetentionPolicies` - Creation of managed instance backup with Long term retention policy. 
- `Microsoft.Sql/managedInstances/administrators` - Adding the active directory admin in managed instance server. 

### AZ command - To enable the failover between the two servers. 

This command will only gets triggered when a value is being passed in the replicaresourcegroup. Else this will be kept as blank. 

- `az sql instance-failover-group create --mi ${var.sqlmi_name} --name failovergroup --partner-mi ${var.replicaresourcename} --resource-group ${local.resource_group_name} --partner-resource-group ${var.replicaresourcegroup} --subscription ${data.azurerm_client_config.current.subscription_id}"`


## Output               

- `Managed Instance name` - Name of the Managed Instance Server.