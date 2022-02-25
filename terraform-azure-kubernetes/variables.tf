# Basics --------------------------------------------
variable create_resource_group {
    type = bool
}

variable resource_group_name {
 }

variable "location" {
    type = string
}

variable aks_cluster_name {
}

variable kubernetes_version {
    #default = "1.19.0"
}

variable private_cluster_enabled {
  default = true
}

variable aad_group_object_id {
  default = "cd03c2eb-2f8a-4408-a607-7b358daec545"
}
#variable private_dns_zone_id {}

variable vm_size {
    #default = "Standard_D2_v2"
}

variable os_disk_size_gb {
    #default  = 30
}

variable os_disk_type {}

variable node_count {
    #default = 2
}

# Node pools 
#variable node_pool_type {
#    default = "VirtualMachineScaleSets"
#}

variable node_max_pods {
  default = 30
}

variable node_enable_autoscale {
  type = bool
  default = true        
}
    
variable node_max_count {
  type = number
  #default =  5
}

variable node_min_count {
  type = number
  #default =  2
}

#variable node_az {
#  default = [1,2,3]
#}

# Networking  ----------------------------
## vnet
variable  vnet_name {}

## vnet_resource_group **
variable vnet_resource_group {}

## subnet
variable  subnet_name {
  #default = "test_aks_subnet"
}

#variable subnet_address_prefixes {
  #default    = "10.1.1.0/25"
  #default    = "10.2.1.0/25"
#}

## network profile
variable net_plugin {
  default = "azure"
}

variable net_policy { 
  default = "azure"
}


# -------------------- Log Analytics using mapping---------

variable "log_an_workspace" {
  default = {
    "GO02_sea" ={
      "logan_ws_name" = "la-go02-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-go02-eas-p-akslog-workspace"
    },
    "GO02_eas" = {
      "logan_ws_name" = "la-go02-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-go02-eas-p-akslog-workspace"
    },
    "AV01_eas" = {
      "logan_ws_name" = "la-av01-eas-p-aksanalytics-workspace01"
      "logan_rg" = "rg-av01-eas-p-akslog-workspace"
    },
    "AV01_sea" = {
      "logan_ws_name" = "la-av01-eas-p-aksanalytics-workspace01"
      "logan_rg" = "rg-av01-eas-p-akslog-workspace"
    },
    "DP01_sea" = {
      "logan_ws_name" = "la-dp01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-dp01-sea-p-akslog-workspace01"
    },
    "DP01_eas" = {
      "logan_ws_name" = "la-dp01-eas-p-aksanalytics-workspace01"
      "logan_rg" = "rg-dp01-eas-p-akslog-workspace01"
    },
    "ID01_sea" = {
      "logan_ws_name" = "la-id01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-id01-sea-p-akslog-workspace"
    },
    "ID01_eas" = {
      "logan_ws_name" = "la-id01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-id01-sea-p-akslog-workspace"
    },
    "KH01_eas" = {
      "logan_ws_name" = "la-kh01-eas-p-aksanalytics-workspace01"
      "logan_rg" =  "rg-kh01-eas-p-akslog-workspace"
    },
    "KH01_sea" = {
      "logan_ws_name" = "la-kh01-eas-p-aksanalytics-workspace01"
      "logan_rg" =  "rg-kh01-eas-p-akslog-workspace"
    },
    "LK01_sea" = {
      "logan_ws_name" = "la-lk01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-lk01-sea-p-akslog-workspace"
    },
    "LK01_eas" = {
      "logan_ws_name" = "la-lk01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-lk01-sea-p-akslog-workspace"
    },
    "MM01_sea" = {
      "logan_ws_name" = "la-mm01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-mm01-sea-p-akslog-workspace"
    },
    "MM01_eas" = {
      "logan_ws_name" = "la-mm01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-mm01-sea-p-akslog-workspace"
    },
    "MY01_eas" = {
      "logan_ws_name" = "la-my01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-my01-sea-p-akslog-workspace"
    },
    "MY01_sea" = {
      "logan_ws_name" = "la-my01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-my01-sea-p-akslog-workspace"
    },
    "PH01_eas" = {
      "logan_ws_name" = "la-ph01-eas-p-aksanalytics-workspace01"
      "logan_rg" = "rg-ph01-eas-p-akslog-workspace"
    },
    "PH01_sea" = {
      "logan_ws_name" = "la-ph01-eas-p-aksanalytics-workspace01"
      "logan_rg" = "rg-ph01-eas-p-akslog-workspace"
    },
    "TH01_sea" = {
      "logan_ws_name" = "la-th01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-th01-sea-p-akslog-workspace"
    },
    "TH01_eas" = {
      "logan_ws_name" = "la-th01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-th01-sea-p-akslog-workspace"
    },
    "TS01_eas" = {
      "logan_ws_name" = "la-ts01-eas-p-aksanalytics-workspace01"
      "logan_rg" = "rg-ts01-eas-p-akslog-workspace"
    },
    "TS01_sea" = {
      "logan_ws_name" = "la-ts01-eas-p-aksanalytics-workspace01"
      "logan_rg" = "rg-ts01-eas-p-akslog-workspace"
    },
    "VN01_sea" = {
      "logan_ws_name" = "la-vn01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-vn01-sea-p-akslog-workspace"
    },
    "VN01_eas" = {
      "logan_ws_name" = "la-vn01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-vn01-sea-p-akslog-workspace"
    },
    # "AU01_eas" = {
    #   "logan_ws_name" = "la-au01-aue-p-aksanalytics-workspace01"
    #   "logan_rg" = "rg-au01-aue-p-akslog-workspace01"
    # },
    # "AU01_sea" = {
    #   "logan_ws_name" = "la-au01-aus-p-aksanalytics-workspace01"
    #   "logan_rg" = "rg-au01-aus-p-akslog-workspace01"
    # },
    "HK01_eas" = {
      "logan_ws_name" = "la-hk01-eas-p-analytics-workspace01"
      "logan_rg" = "rg-hk01-eas-p-infrasvc01-monitor01"
    },
    "HK01_sea" = {
      "logan_ws_name" = "la-hk01-sea-p-analytics-workspace01"
      "logan_rg" = "rg-hk01-sea-p-infrasvc01-monitor01"
    },
    "GO01_eas" = {
      "logan_ws_name" = "la-go01-eas-p-analytics-workspace01"
      "logan_rg" = "rg-go01-eas-p-sharedsrv01-common01"
    },
    "GO01_sea" = {
      "logan_ws_name" = "la-go01-sea-p-analytics-workspace01"
      "logan_rg" = "rg-go01-eas-p-sharedsrv01-common01"
    },
    "SG01_eas" = {
      "logan_ws_name" = "la-sg01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-sg01-sea-p-akslog-workspace"
    },
    "SG01_sea" = {
      "logan_ws_name" = "la-sg01-sea-p-aksanalytics-workspace01"
      "logan_rg" = "rg-sg01-sea-p-akslog-workspace"
    }
    "AU01_aue" = {
      "logan_ws_name" = "la-au01-aue-p-aksanalytics-workspace01"
      "logan_rg" = "rg-au01-aue-p-akslog-workspace01"
    },
    "AU01_aus" = {
      "logan_ws_name" = "la-au01-aus-p-aksanalytics-workspace01"
      "logan_rg" = "rg-au01-aus-p-akslog-workspace01"
    }
  }
}

# ----- User managed identity string ----

variable "user_msi" {
  default = {
    "GO01_eas_P" = {
	    "msi_id_name" = "msi-aks-go01-eas-p-shared-aks01"
	    "msi_rg" = "rg-go01-eas-p-PrivateAKS-aks01"
    }
    "GO01_eas_N" = {	
      "msi_id_name" = "msi-aks-go01-eas-n-shared-aks01"
      "msi_rg" = "rg-go01-eas-n-PrivateAKS-aks01"
    }
    "GO01_sea_P" =	{
      "msi_id_name" = "msi-aks-go01-sea-p-shared-aks01"
      "msi_rg" = "rg-go01-sea-p-PrivateAKS-aks01"
    }
    "GO01_sea_N" =	{ 
      "msi_id_name" = "msi-aks-go01-sea-n-shared-aks01"
      "msi_rg" = "rg-go01-sea-n-PrivateAKS-aks01"
    }
    "GO02_eas_P"	= {
      "msi_id_name" = "msi-aks-go02-eas-p-shared-aks01"
      "msi_rg" = "rg-go02-eas-p-PrivateAKS-aks01"
    }
    "GO02_eas_N" = {
      "msi_id_name" = "msi-aks-go02-eas-n-shared-aks01"
      "msi_rg" = "rg-go02-eas-n-PrivateAKS-aks01"
    }
    "GO02_sea_P" = {
      "msi_id_name" = "msi-aks-go02-sea-p-shared-aks01"
      "msi_rg" = "rg-go02-sea-p-PrivateAKS-aks01"
    }
    "GO02_sea_N"	= {
      "msi_id_name" = "msi-aks-go02-sea-n-shared-aks01"
      "msi_rg" = "rg-go02-sea-n-PrivateAKS-aks01"
    }
    "HK01_eas_P" = {
      "msi_id_name" = "msi-aks-hk01-eas-p-shared-aks01"
      "msi_rg" = "rg-hk01-eas-p-PrivateAKS-aks01"
    }
    "HK01_eas_N" = {
      "msi_id_name" = "msi-aks-hk01-eas-n-shared-aks01"
      "msi_rg" = "rg-hk01-eas-n-PrivateAKS-aks01"
    }
    "HK01_sea_P" = {
      "msi_id_name" = "msi-aks-hk01-sea-p-shared-aks01"
      "msi_rg" = "rg-hk01-sea-p-PrivateAKS-aks01"
    }
    "HK01_sea_N" = {
      "msi_id_name" = "msi-aks-hk01-sea-n-shared-aks01"
      "msi_rg" = "rg-hk01-sea-n-PrivateAKS-aks01"
    }
    "SG01_eas_P" = {
      "msi_id_name" = "msi-aks-sg01-eas-p-shared-aks01"
      "msi_rg" = "rg-sg01-eas-p-PrivateAKS-aks01"
    }
    "SG01_eas_N" = {
      "msi_id_name" = "msi-aks-sg01-eas-n-shared-aks01"
      "msi_rg" = "rg-sg01-eas-n-PrivateAKS-aks01"
    }
    "SG01_sea_P" = {
      "msi_id_name" = "msi-aks-sg01-sea-p-shared-aks01"
      "msi_rg" = "rg-sg01-sea-p-PrivateAKS-aks01"
    }
    "SG01_sea_N" = {
      "msi_id_name" = "msi-aks-sg01-sea-n-shared-aks01"
      "msi_rg" = "rg-sg01-sea-n-PrivateAKS-aks01"
    }
    "ID01_eas_P" = {
      "msi_id_name" = "msi-aks-id01-eas-p-shared-aks01"
      "msi_rg" = "rg-id01-eas-n-PrivateAKS-aks01"
    }
    "ID01_eas_N" = {
      "msi_id_name" = "msi-aks-id01-eas-n-shared-aks01"
      "msi_rg" = "rg-id01-eas-n-PrivateAKS-aks01"
    }
    "ID01_sea_P" = {
      "msi_id_name" = "msi-aks-id01-sea-p-shared-aks01"
      "msi_rg" = "rg-id01-sea-n-PrivateAKS-aks01"
    }
    "ID01_sea_N" = {
      "msi_id_name" = "msi-aks-id01-sea-n-shared-aks01"
      "msi_rg" = "rg-id01-sea-n-PrivateAKS-aks01"
    }
    "KH01_eas_P" = {
      "msi_id_name" = "msi-aks-kh01-eas-p-shared-aks01"
      "msi_rg" = "rg-kh01-eas-n-PrivateAKS-aks01"
    }
    "KH01_eas_N" = {
      "msi_id_name" = "msi-aks-kh01-eas-n-shared-aks01"
      "msi_rg" = "rg-kh01-eas-n-PrivateAKS-aks01"
    }
    "KH01_sea_P" = {
      "msi_id_name" = "msi-aks-kh01-sea-p-shared-aks01"
      "msi_rg" = "rg-kh01-sea-n-PrivateAKS-aks01"
    }
    "KH01_sea_N" = {
      "msi_id_name" = "msi-aks-kh01-sea-n-shared-aks01"
      "msi_rg" = "rg-kh01-sea-n-PrivateAKS-aks01"
    }
    "LK01_eas_P" = {
      "msi_id_name" = "msi-aks-lk01-eas-p-shared-aks01"
      "msi_rg" = "rg-lk01-eas-n-PrivateAKS-aks01"
    }
    "LK01_eas_N" = {
      "msi_id_name" = "msi-aks-lk01-eas-n-shared-aks01"
      "msi_rg" = "rg-lk01-eas-n-PrivateAKS-aks01"
    }
    "LK01_sea_P" = {
      "msi_id_name" = "msi-aks-lk01-sea-p-shared-aks01"
      "msi_rg" = "rg-lk01-sea-n-PrivateAKS-aks01"
    }
    "LK01_sea_N" = {
      "msi_id_name" = "msi-aks-lk01-sea-n-shared-aks01"
      "msi_rg" = "rg-lk01-sea-n-PrivateAKS-aks01"
    }
    "MM01_eas_P" = {
      "msi_id_name" = "msi-aks-mm01-eas-p-shared-aks01"
      "msi_rg" = "rg-mm01-eas-n-PrivateAKS-aks01"
    }
    "MM01_eas_N" = {
      "msi_id_name" = "msi-aks-mm01-eas-n-shared-aks01"
      "msi_rg" = "rg-mm01-eas-n-PrivateAKS-aks01"
    }
    "MM01_sea_P" = {
      "msi_id_name" = "msi-aks-mm01-sea-p-shared-aks01"
      "msi_rg" = "rg-mm01-sea-n-PrivateAKS-aks01"
    }
    "MM01_sea_N" = {
      "msi_id_name" = "msi-aks-mm01-sea-n-shared-aks01"
      "msi_rg" = "rg-mm01-sea-n-PrivateAKS-aks01"
    }
    "MY01_eas_P" = {
      "msi_id_name" = "msi-aks-my01-eas-p-shared-aks01"
      "msi_rg" = "rg-my01-eas-n-PrivateAKS-aks01"
    }
    "MY01_eas_N" = {
      "msi_id_name" = "msi-aks-my01-eas-n-shared-aks01"
      "msi_rg" = "rg-my01-eas-n-PrivateAKS-aks01"
    }
    "MY01_sea_P" = {
      "msi_id_name" = "msi-aks-my01-sea-p-shared-aks01"
      "msi_rg" = "rg-my01-sea-n-PrivateAKS-aks01"
    }
    "MY01_sea_N" = {
      "msi_id_name" = "msi-aks-my01-sea-n-shared-aks01"
      "msi_rg" = "rg-my01-sea-n-PrivateAKS-aks01"
    }
    "PH01_eas_P" = {
      "msi_id_name" = "msi-aks-ph01-eas-p-shared-aks01"
      "msi_rg" = "rg-ph01-eas-n-PrivateAKS-aks01"
    }
    "PH01_eas_N" = {
      "msi_id_name" = "msi-aks-ph01-eas-n-shared-aks01"
      "msi_rg" = "rg-ph01-eas-n-PrivateAKS-aks01"
    }
    "PH01_sea_P" = {
      "msi_id_name" = "msi-aks-ph01-sea-p-shared-aks01"
      "msi_rg" = "rg-ph01-sea-n-PrivateAKS-aks01"
    }
    "PH01_sea_N" = {
      "msi_id_name" = "msi-aks-ph01-sea-n-shared-aks01"
      "msi_rg" = "rg-ph01-sea-n-PrivateAKS-aks01"
    }
    "TH01_eas_P" = {
      "msi_id_name" = "msi-aks-th01-eas-p-shared-aks01"
      "msi_rg" = "rg-th01-eas-n-PrivateAKS-aks01"
    }
    "TH01_eas_N" = {
      "msi_id_name" = "msi-aks-th01-eas-n-shared-aks01"
      "msi_rg" = "rg-th01-eas-n-PrivateAKS-aks01"
    }
    "TH01_sea_P" = {
      "msi_id_name" = "msi-aks-th01-sea-p-shared-aks01"
      "msi_rg" = "rg-th01-sea-n-PrivateAKS-aks01"
    }
    "TH01_sea_N" = {
      "msi_id_name" = "msi-aks-th01-sea-n-shared-aks01"
      "msi_rg" = "rg-th01-sea-n-PrivateAKS-aks01"
    }
    "VN01_eas_P" = {
      "msi_id_name" = "msi-aks-vn01-eas-p-shared-aks01"
      "msi_rg" = "rg-vn01-eas-n-PrivateAKS-aks01"
    }
    "VN01_eas_N" = {
      "msi_id_name" = "msi-aks-vn01-eas-n-shared-aks01"
      "msi_rg" = "rg-vn01-eas-n-PrivateAKS-aks01"
    }
    "VN01_sea_P" = {
      "msi_id_name" = "msi-aks-vn01-sea-p-shared-aks01"
      "msi_rg" = "rg-vn01-sea-n-PrivateAKS-aks01"
    }
    "VN01_sea_N" = {
      "msi_id_name" = "msi-aks-vn01-sea-n-shared-aks01"
      "msi_rg" = "rg-vn01-sea-n-PrivateAKS-aks01"
    }
    "TS01_eas_P" = {
      "msi_id_name" = "msi-aks-ts01-eas-p-shared-aks01"
      "msi_rg" = "rg-ts01-eas-n-PrivateAKS-aks01"
    }
    "TS01_eas_N" = {
      "msi_id_name" = "msi-aks-ts01-eas-n-shared-aks01"
      "msi_rg" = "rg-ts01-eas-n-PrivateAKS-aks01"
    }
    "TS01_sea_P" = {
      "msi_id_name" = "msi-aks-ts01-sea-p-shared-aks01"
      "msi_rg" = "rg-ts01-sea-n-PrivateAKS-aks01"
    }
    "TS01_sea_N" = {
      "msi_id_name" = "msi-aks-ts01-sea-n-shared-aks01"
      "msi_rg" = "rg-ts01-sea-n-PrivateAKS-aks01"
    }
    "AU01_aue_P" = {
      "msi_id_name" = "msi-aks-au01-aue-p-shared-aks01"
      "msi_rg" = "rg-au01-aue-p-privateaks-aks01"
    }
    "AU01_aue_N" = {
      "msi_id_name" = "msi-aks-au01-aue-d-shared-aks01"
      "msi_rg" = "rg-au01-aue-d-privateaks-aks01"
    }
    "AU01_aus_P" = {
      "msi_id_name" = "msi-aks-au01-aus-p-shared-aks01"
      "msi_rg" = "rg-au01-aus-p-privateaks-aks01"
    }
    "AU01_aus_N" = {
      "msi_id_name" = "msi-aks-au01-aus-d-shared-aks01"
      "msi_rg" = "rg-au01-aus-d-privateaks-aks01"
    }
  }
}

############### TAGS ###################
# --- Basic tags------------
variable "environment" {
}

#variable "tags" {}


############### TAGS from Templates ###################
# variable "location" {
# }

# variable "environment" {
# }

variable "project_name" {
  default = "Test Project"
}

variable "application_name" {
  default = "Test Application"
}

variable "application_type" {
  default = "Azure PaaS- AKS"
}

# ------ Other Tags ---------------
variable "ibm_imi_managed_env" {}

variable "business_unit" {}

variable "cost_center" {}

variable "wbs_code" {
  default = ""
}

variable "server_owner" {}

variable "business_owner" {}

variable "application_service" {}

variable "business_application" {}

variable "subscription" {
  default = null
}

variable "request_item_number" {}

variable "ibm_imi_managed_env_map" {
  type = map
  default = {
    P  = "Production System"
    U  = "User Acceptance System/ QA"
    S  = "System Integration System"
    R  = "Disaster Recover System"
    G  = "Regression Test"
    D  = "Development System and Testing"
    N  = "Non-Production System"
  }
}

variable "ibm_imi_managed" {
  default = "No"
}