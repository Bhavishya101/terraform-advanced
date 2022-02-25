#-----------------------------------------------------------------
#Variables to define the location.  
#-----------------------------------------------------------------
variable "location" {
  description = "The location/region where we are creating the resource."
  type        = string
#  validation {
#    condition = can (regex ( "eastasia|southeastasia" , var.location))
#    error_message = "The location is not valid, it should be only eastasia and southeastasia."
#  }
}

#-----------------------------------------------------------------
#Variables to manage Resource group. 
#-----------------------------------------------------------------
variable "create_resource_group" {
  description = "Whether to create resource group and use it to create the storage account"
  type        = bool
}

variable "resource_group_name" {
  description = "The name of the resource group we want to use"
  type        = string
}

variable "administratorLogin" {
  description = "User name to login to the SQL MI server"
  type        = string
  default = "sqlmiadmin"
}


variable "sqlmi_name" {
  description = "Name of the managed instance name"
  type        = string
}

#-----------------------------------------------------------------
#Variables for the secret from the keyvault for server login. 
#-----------------------------------------------------------------
variable "subscription" {
    description = "Name of the Subscription"
    type        = string
}

variable "resource_group_name_keyvault" {
  description = "Name of the resource group for keyvault"
  type        = string
  default = "rg-go01-eas-p-sharedsrv01-keyvault01"
}

variable "keyvault_name" {
  description = "Name of the keyvault which is used to store keys and secrets."
  type        = string
  default = "kv-go01-eas-p-key-vlt01"
}

variable "keyvault_secret" {
  description = "Name of the secret used for authentication"
  type        = string
  default = "SQLMIPassword"
}

#-----------------------------------------------------------------
#Variables for other configuration details for SQL MI.  
#-----------------------------------------------------------------

variable "sku_name" {
  type        = string
  description = "Name of the pricing tier required for the resource"
  default = "GP_Gen5"  # Hardcoding the value and not fetcing from template as per request made by Sergey.
}
variable "skuedition" {
  description = "Edition of the SKU required"
  type        = string
  default = "GeneralPurpose"
}
variable "proxyoverride" {
  description = "Connectivity required for the resource"
  type        = string
  default = "Proxy"
}
variable "timezone" {
  description = "Timezone of the resource"
  type        = string
  default = "China Standard Time "
}
variable "collation" {
  description = "Collation of the Database"
  type        = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}
variable "vcore" {
  description = "No. of cores required for resource"
  type        = string
  default = "4"
}
variable "storage_gb" {
  description = "Storage size required for the resource."
  type        = string
  default = "256"
}
variable "backup_retention_days" {
  description = "Number fo Days to Retain the backup."
  type        = string
  default = ""
}

variable "license_type" {
  description = "License required or already have the license"
  type        = string
  default = "LicenseIncluded"
}

# variable "AADAdminLogin" {
#   description = "Name of the AD group to enable access"
#   default = "AIA-G-Azure-SQLServer"
# }
# variable "AADAdminObjectID" {
#   description = "Object id for the Subscription"
#   default = "f95277aa-ba09-4e04-ad27-c9d0024099ae"
# }

variable "vnet_name" {
  description = "Name of the Virtual network used"
  
}
variable "vnet_subnet_name" {
  description = "Name of the subnet"
  
}
variable "vnet_resource_group" {
  description = "Name of resource group from where virtual network is being used"
  
}

variable "dbname" {
  description = "Name of the database"
  type = string
  default = ""
}

#---------------------------------------------------------
# Variables for secondary resource for failover. 
#----------------------------------------------------------

variable "server_type" {
description = "Enable/Disable replication for the server."
type = string
}

variable "deployment_mode" {
description = "Enable/Disable failover for the server."
type = string
}

variable "replicaresourcegroup" {
  description = "Name of the Replica Resource group"
  type = string
  default = ""
}

variable "replicaresourcename" {
  description = "Name of the replica Resource Name"
  type = string
  default = ""
}

variable "weeklyretention" {
  description = "Weekly retention period"
  type = string
  default = "P6W"
}

variable "monthlyretention" {
  description = "Monthly retention period"
  type = string
  default = "P13M"
}

variable "yearlyretention" {
  description = "Yearly retention period"
  type = string
  default = "P10Y"
}

variable "weekofyear" {
  description = "Week of Year"
  type = string
  default = "1"
}
#---------------------------------------------------------
# Optional Variables
#----------------------------------------------------------

variable "environment" {
  description = "Environemnt name for the tagging purpose"
  type        = string
}

variable "request_item_number" {
  description = "Request item number for the tagging purpose"
  type        = string
}

variable "project_name" {
  description = "Project name for the tagging purpose"
  type        = string
}

variable "application_name" {
  description = "Application name for the tagging purpose"
  type        = string
}

variable "ibm_imi_managed_env"{
  description = "ibm_imi_managed_env for the tagging purpose"
  type        = string
}

variable "business_unit" {
  description = "Business unit for the tagging purpose"
  type        = string
}

variable "cost_center"{
  description = "Cost center for the tagging purpose"
  type        = string
}

variable "wbs_code"{
  description = "WBS code for the tagging purpose"
  type        = string
}

variable "server_owner"{
  description = "Server code for the tagging purpose"
  type        = string
}
variable "business_owner"{
  description = "Business owner for the tagging purpose"
  type        = string
}
variable "application_service" {
  description = "Application Service for the tagging purpose"
  type        = string
}

variable "business_application"{
  description = "Business Application for the tagging purpose"
  type        = string
}

variable "ibm_imi_managed"{
  type    = string
  default = "Yes"
}

variable "ibm_imi_managed_env_map"{
  description = "mapping values for ibm_imi_managed_env"
  type        = map
  default     = {
    P = "Production System"
    U = "User Acceptance System/ QA"
    S = "System Integration System"
    R = "Disaster Recover System"
    G = "Regression Test"
    D = "Development System and Testing"
    N = "Non-Production System"
  }
}

#---------------------------------------------------------
# Map for EventHub
#----------------------------------------------------------

variable "eventhub_audit" {
    description = "Event Hub details for diagnostic"
    type        = map(any)
    default     = {
        "eastasia"          = ["rg-go01-eas-p-sharedsrv01-common01","ehns-go01-eas-p-eventhub-namespace02","sqlserver-log01"]
        "southeastasia"     = ["rg-go01-sea-p-sharedsrv01-common01","ehns-go01-sea-p-eventhub-namespace01","sqlserver-log01"]

        "australiaeast"       = ["rg-au01-aue-p-sharedsrv01-common01","ehns-au01-aue-p-eventhub-namespace01","sqlserver-log01"]
        "australiasoutheast"  = ["rg-au01-aus-p-sharedsrv01-common01","ehns-au01-aus-p-eventhub-namespace01","sqlserver-log01"]
    }
}

variable "eventHubName" {
    description = "Event Hub name"
    type = string
    default = "sqlserver-log01"
}

#---------------------------------------------------------
# Variables for key vault
#--------------------------------------------------------
variable "keyvault" {
    description = "The tags to associate the resource we are creating"
    type        = map(any)
    default     = {
        "go01-n"  = ["rg-go01-eas-n-sec01-keyvault01", "kv-go01-eas-n-sql-vlt01", "key-go01-n-sqltde-key01"]
        "go01-p"  = ["rg-go01-eas-p-sec01-keyvault01", "kv-go01-eas-p-sql-vlt01", "key-go01-p-sqltde-key01"]
        "go01-r"  = ["rg-go01-eas-p-sec01-keyvault01", "kv-go01-eas-p-sql-vlt01", "key-go01-p-sqltde-key01"]
        "go02-n"  = ["rg-go02-eas-n-sec01-keyvault01", "kv-go02-eas-n-sql-vlt01", "key-go02-n-sqltde-key01"]
        "go02-p"  = ["rg-go02-eas-p-sec01-keyvault01", "kv-go02-eas-p-sql-vlt01", "key-go02-p-sqltde-key01"]
        "go02-r"  = ["rg-go02-eas-p-sec01-keyvault01", "kv-go02-eas-p-sql-vlt01", "key-go02-p-sqltde-key01"]
        "sg01-n"  = ["rg-sg01-sea-n-sec01-keyvault01", "kv-sg01-sea-n-sql-vlt01", "key-sg01-n-sqltde-key01"]
        "sg01-p"  = ["rg-sg01-sea-p-sec01-keyvault01", "kv-sg01-sea-p-sql-vlt01", "key-sg01-p-sqltde-key01"]
        "sg01-r"  = ["rg-sg01-sea-p-sec01-keyvault01", "kv-sg01-sea-p-sql-vlt01", "key-sg01-p-sqltde-key01"]
#        "au01-n"  = ["rg-au01-aue-n-sec01-keyvault01", "kv-au01-aue-n-sql-vlt01", "key-au01-n-sqltde-key01"]
#        "au01-p"  = ["rg-au01-aue-p-sec01-keyvault01", "kv-au01-aue-p-sql-vlt01", "key-au01-p-sqltde-key01"]
#        "au01-r"  = ["rg-au01-aue-p-sec01-keyvault01", "kv-au01-aue-p-sql-vlt01", "key-au01-p-sqltde-key01"]
        "av01-p"  = ["rg-av01-eas-p-sharedsrv01-keyvault01", "kv-av01-eas-p-sql-vlt01", "key-av01-p-sqltde-key01"]
        "av01-r"  = ["rg-av01-eas-p-sharedsrv01-keyvault01", "kv-av01-eas-p-sql-vlt01", "key-av01-p-sqltde-key01"]
        "av01-n"  = ["rg-av01-eas-p-sharedsrv01-keyvault01", "kv-av01-eas-n-sql-vlt01", "key-av01-n-sqltde-key01"]
        "dp01-p"  = ["rg-dp01-eas-p-sec01-keyvault01", "kv-dp01-eas-p-sql-vlt01", "key-dp01-p-sqltde-key01"]
        "dp01-r"  = ["rg-dp01-eas-p-sec01-keyvault01", "kv-dp01-eas-p-sql-vlt01", "key-dp01-p-sqltde-key01"]
        "dp01-n"  = ["rg-dp01-eas-n-sec01-keyvault01", "kv-dp01-eas-n-sql-vlt01", "key-dp01-n-sqltde-key01"]
        "hk01-p"  = ["rg-hk01-eas-p-infrasvc01-keyvault01", "kv-hk01-eas-p-sql-vlt01", "key-hk01-p-sqltde-key01"]
        "hk01-r"  = ["rg-hk01-eas-p-infrasvc01-keyvault01", "kv-hk01-eas-p-sql-vlt01", "key-hk01-p-sqltde-key01"]
        "hk01-n"  = ["rg-hk01-eas-n-infrasvc01-keyvault01", "kv-hk01-eas-n-sql-vlt01", "key-hk01-n-sqltde-key01"]
        "id01-n"  = ["rg-id01-sea-n-sec01-keyvault01", "kv-id01-sea-n-sql-vlt01", "key-id01-n-sqltde-key01"]
        "id01-p"  = ["rg-id01-sea-p-sec01-keyvault01", "kv-id01-sea-p-sql-vlt01", "key-id01-p-sqltde-key01"]
        "id01-r"  = ["rg-id01-sea-p-sec01-keyvault01", "kv-id01-sea-p-sql-vlt01", "key-id01-p-sqltde-key01"]
        "kh01-n"  = ["rg-kh01-eas-n-sec01-keyvault01", "kv-kh01-eas-n-sql-vlt01", "key-kh01-n-sqltde-key01"]
        "kh01-p"  = ["rg-kh01-eas-p-sec01-keyvault01", "kv-kh01-eas-p-sql-vlt01", "key-kh01-p-sqltde-key01"]
        "kh01-r"  = ["rg-kh01-eas-p-sec01-keyvault01", "kv-kh01-eas-p-sql-vlt01", "key-kh01-p-sqltde-key01"]
        "kr02-p"  = ["rg-kr02-krc-p-sec01-keyvault01", "kv-kr02-krc-p-sql-vlt01", "key-kr02-p-sqltde-key01"]
        "kr02-r"  = ["rg-kr02-krc-p-sec01-keyvault01", "kv-kr02-krc-p-sql-vlt01", "key-kr02-p-sqltde-key01"]
        "kr02-n"  = ["rg-kr02-krc-n-sec01-keyvault01", "kv-kr02-krc-n-sql-vlt01", "key-kr02-n-sqltde-key01"]
        "mm01-n"  = ["rg-mm01-sea-n-sec01-keyvault01", "kv-mm01-sea-n-sql-vlt01", "key-mm01-n-sqltde-key01"]
        "mm01-p"  = ["rg-mm01-sea-p-sec01-keyvault01", "kv-mm01-sea-p-sql-vlt01", "key-mm01-p-sqltde-key01"]
        "mm01-r"  = ["rg-mm01-sea-p-sec01-keyvault01", "kv-mm01-sea-p-sql-vlt01", "key-mm01-p-sqltde-key01"]
        "my01-n"  = ["rg-my01-sea-n-sec01-keyvault01", "kv-my01-sea-n-sql-vlt01", "key-my01-n-sqltde-key01"]
        "my01-p"  = ["rg-my01-sea-p-sec01-keyvault01", "kv-my01-sea-p-sql-vlt01", "key-my01-p-sqltde-key01"]
        "my01-r"  = ["rg-my01-sea-p-sec01-keyvault01", "kv-my01-sea-p-sql-vlt01", "key-my01-p-sqltde-key01"]
        "ph01-n"  = ["rg-ph01-eas-n-sec01-keyvault01", "kv-ph01-eas-n-sql-vlt01", "key-ph01-n-sqltde-key01"]
        "ph01-p"  = ["rg-ph01-eas-p-sec01-keyvault01", "kv-ph01-eas-p-sql-vlt01", "key-ph01-p-sqltde-key01"]
        "ph01-r"  = ["rg-ph01-eas-p-sec01-keyvault01", "kv-ph01-eas-p-sql-vlt01", "key-ph01-p-sqltde-key01"]
        "th01-n"  = ["rg-th01-eas-n-sec01-keyvault01", "kv-th01-eas-n-sql-vlt01", "key-th01-n-sqltde-key01"]
        "th01-p"  = ["rg-th01-eas-p-sec01-keyvault01", "kv-th01-eas-p-sql-vlt01", "key-th01-p-sqltde-key01"]
        "th01-r"  = ["rg-th01-eas-p-sec01-keyvault01", "kv-th01-eas-p-sql-vlt01", "key-th01-p-sqltde-key01"]
        "lk01-n"  = ["rg-lk01-sea-n-sharedsrv01-keyvault01", "kv-lk01-sea-n-key-sql01", "key-lk01-n-sqltde-key01"]
        "lk01-p"  = ["rg-lk01-sea-p-sharedsrv01-keyvault01", "kv-lk01-sea-p-key-sql01", "key-lk01-p-sqltde-key01"]
        "lk01-r"  = ["rg-lk01-sea-p-sharedsrv01-keyvault01", "kv-lk01-sea-p-key-sql01", "key-lk01-p-sqltde-key01"]
        "ts01-n"  = ["rg-ts01-eas-n-sec01-keyvault01", "kv-ts01-eas-n-sql-vlt01", "key-ts01-n-sqltde-key01"]
        "ts01-p"  = ["rg-ts01-eas-n-sec01-keyvault01", "kv-ts01-eas-n-sql-vlt01", "key-ts01-n-sqltde-key01"]
        "ts01-r"  = ["rg-ts01-eas-n-sec01-keyvault01", "kv-ts01-eas-n-sql-vlt01", "key-ts01-n-sqltde-key01"]
        "vn01-n"  = ["rg-vn01-sea-n-sec01-keyvault01", "kv-vn01-sea-n-sql-vlt01", "key-vn01-n-sqltde-key01"]
        "vn01-p"  = ["rg-vn01-sea-p-sec01-keyvault01", "kv-vn01-sea-p-sql-vlt01", "key-vn01-p-sqltde-key01"]
        "vn01-r"  = ["rg-vn01-sea-p-sec01-keyvault01", "kv-vn01-sea-p-sql-vlt01", "key-vn01-p-sqltde-key01"]
        "au01-n"  = ["rg-au01-aue-n-sec01-keyvault01", "kv-au01-aue-n-sql-vlt01", "key-au01-n-sqltde-key01"]
        "au01-p"  = ["rg-au01-aue-p-sec01-keyvault01", "kv-au01-aue-p-sql-vlt01", "key-au01-p-sqltde-key01"]
        "au01-r"  = ["rg-au01-aue-p-sec01-keyvault01", "kv-au01-aue-p-sql-vlt01", "key-au01-p-sqltde-key01"]
    }
}

variable "storageaccount_audit" {
  description = "Storage Account details for diagnostic"
  default     = {
    GO01 = {
      eastasia      = ["rg-go01-eas-p-sqllogs-common01","sago01easpsharedsqlads01"]
      southeastasia = ["rg-go01-eas-p-sqllogs-common01","sago01seapsharedsqlads01"]
    },
    GO02 = {
      eastasia      = ["rg-go02-eas-p-sqllogs-common01","sago02easpsharedsqlads01"]
      southeastasia = ["rg-go02-eas-p-sqllogs-common01","sago02seapsharedsqlads01"]
    },
    SG01 = {
      eastasia      = ["rg-sg01-eastasia-p-sqllogs-common01","sasg01easpsharedsqlads01"]
      southeastasia = ["rg-sg01-southeastasia-p-sqllogs-common01","sasg01seapsharedsqlads01"]
    },
    AV01 = {
      eastasia      = ["rg-av01-eastasia-p-sqllogs-common01","saav01easpsharedsqlads01"]
      southeastasia = ["rg-av01-southeastasia-p-sqllogs-common01","saav01seapsharedsqlads01"]
    },
    DP01 = {
      eastasia      = ["rg-dp01-eastasia-p-sqllogs-common01","dp01easpsharedsqlads01"]
      southeastasia = ["rg-dp01-southeastasia-p-sqllogs-common01","sadp01seapsharedsqlads01"]
    },
    HK01 = {
      eastasia      = ["rg-hk01-eastasia-p-sqllogs-common01","sahk01easpsharedsqlads01"]
      southeastasia = ["rg-hk01-southeastasia-p-sqllogs-common01","sahk01seapsharedsqlads01"]
    },
    ID01 = {
      eastasia      = ["rg-id01-eastasia-p-sqllogs-common01","said01easpsharedsqlads01"]
      southeastasia = ["rg-id01-southeastasia-p-sqllogs-common01","id01seapsharedsqlads01"]
    },
    KH01 = {
      eastasia      = ["rg-kh01-eastasia-p-sqllogs-common01","kh01easpsharedsqlads01"]
      southeastasia = ["rg-kh01-southeastasia-p-sqllogs-common01","sakh01seapsharedsqlads01"]
    },
    LK01 = {
      eastasia      = ["rg-lk01-eastasia-p-sqllogs-common01","salk01easpsharedsqlads01"]
      southeastasia = ["rg-lk01-southeastasia-p-sqllogs-common01","salk01seapsharedsqlads01"]
    },
    MM01 = {
      eastasia      = ["rg-mm01-southeastasia-p-sqllogs-common01","samm01easpsharedsqlads01"]
      southeastasia = ["rg-mm01-southeastasia-p-sqllogs-common01","samm01seapsharedsqlads01"]
    },
    MY01 = {
      eastasia      = ["rg-my01-eastasia-p-sqllogs-common01","samy01easpsharedsqlads01"]
      southeastasia = ["rg-my01-southeastasia-p-sqllogs-common01","my01seapsharedsqlads01"]
    },
    PH01 = {
      eastasia      = ["rg-ph01-eastasia-p-sqllogs-common01","ph01easpsharedsqlads01"]
      southeastasia = ["rg-ph01-southeastasia-p-sqllogs-common01","saph01seapsharedsqlads01"]
    },
    TH01 = {
      eastasia      = ["rg-th01-eastasia-p-sqllogs-common01","sath01easpsharedsqlads01"]
      southeastasia = ["rg-th01-southeastasia-p-sqllogs-common01","sath01seapsharedsqlads01"]
    },
    TS01 = {
      eastasia      = ["rg-ts01-eastasia-p-sqllogs-common01","sats01easpsharedsqlads01"]
      southeastasia = ["rg-ts01-southeastasia-p-sqllogs-common01","sats01seapsharedsqlads01"]
    },
    VN01 = {
      eastasia      = ["rg-vn01-eastasia-p-sqllogs-common01","savn01easpsharedsqlads01"]
      southeastasia = ["rg-vn01-southeastasia-p-sqllogs-common01","savn01seapsharedsqlads01"]
    },
    AU01 = {
      australiaeast      = ["rg-au01-aue-p-sqllogs-common01","saau01auepsharedsqlads01"]
      australiasoutheast = ["rg-au01-aus-p-sqllogs-common01","saau01auspsharedsqlads01"]
    }
  }
}

