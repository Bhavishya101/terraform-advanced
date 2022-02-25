/*
variable "subscription_id" {
  type = string
}
*/
variable "region" {
  type = string
}

variable "create_resource_group" {
  description = "Mark this as true to create new resource group, else mark it as false"
}

variable "resource_group_name" {
  type        = string
  description = "provide the new resource group name if 'create_resource_group' is true, else provide existing resource group name if 'create_resource_group' is false"
}

# both create_availability_set and availability_zone can't be true or false at the same time. 
variable "create_availability_set" {
  description = "Mark this variable as true to create new availability set, else false"
}

variable "availabilityset_name" {
  type        = string
  description = "provide teh AS name if 'create_availability_set' as true"
}

variable "availability_zone" {
  description = "Mark this variable as true to deploy a VM in availability zone, else false"
}

variable "zone" {
  type        = number
  description = "zone number if which VM has to be deployed"
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "enable_accelerated_networking" {
  default = false
}
/*
variable "datadisk_size_gb" {
  type = list(number)
}
*/

variable "operatingsystem" {}

/*
variable "Datadisk_type" {
  type = list(string)
}
*/

variable "osdisk_type" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_resourcegroup_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

# Virtual Machine Auto Shutdown Condiguration
variable "enable_vm_auto_shutdown_start" {
  type = bool
}

# Enable backup on virtual machine
variable "enable_backup" {
  type = bool
  default = true
}

# Option to skip ansible workflow
variable "ansible_workflow" {
  type = bool
  default = true
}

#variable "subscription_id" {}
variable "subscription" {}
variable "environment" {}

variable "ansible_tower_env" {
  default = "uat"
}

variable "service_now_env" {
  default = "aiatest2"
}

variable "inventory_id_map" {
  description = "The ansible inventory id - azure subscription map."
  default = {
    AV01 = 11,
    DP01 = 20,
    GO01 = 3,
    GO02 = 4,
    HK01 = 6,
    ID01 = 21,
    KH01 = 19,
    LK01 = 12,
    MM01 = 17,
    MY01 = 16,
    MY02 = 15,
    PH01 = 14,
    SG01 = 7,
    TH01 = 18,
    TS01 = 13,
    VN01 = 10,
    AU01 = 34
  }
}

variable "credential_id_map" {
  description = "The ansible credential id - azure subscription map."
  default = {
    AV01 =  10,
    DP01 =  19,
    GO01 =  4,
    GO02 =  3,
    HK01 =  21,
    ID01 =  20,
    KH01 =  18,
    LK01 =  11,
    MM01 =  16,
    MY01 =  15,
    MY02 =  14,
    OPM  =  5,
    PH01 =  13,
    SG01 =  26,
    TH01 =  17,
    TS01 =  12,
    VN01 =  9,
    AU01 =  80

  }
}

variable "timezone_map" {
  description = "Map of timezones and subscriptions"
  default = {
    AV01 = "Asia/Hong_Kong",
    DP01 = "Asia/Hong_Kong",
    GO01 = "Asia/Hong_Kong",
    GO02 = "Asia/Hong_Kong",
    HK01 = "Asia/Hong_Kong",
    ID01 = "Asia/Jakarta",
    KH01 = "Asia/Vientiane",
    LK01 = "Asia/Kolkata",
    MM01 = "Asia/Yangon",
    MY01 = "Asia/Kuala_Lumpur",
    MY02 = "Asia/Kuala_Lumpur",
    PH01 = "Asia/Manila",
    SG01 = "Asia/Singapore",
    TH01 = "Asia/Vientiane",
    TS01 = "Asia/Bangkok",
    VN01 = "Asia/Vientiane",
    AU01 = "Australia/Sydney",
  }
}

variable "automation_account" {
  default = {
    "GO01" = {
      "autoaccount_name" = "aaa-go01-sea-p-shardsrv01-01"
      "autoaccount_rg"   = "rg-go01-eas-p-sharedsrv01-common01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "GO02" = {
      "autoaccount_name" = "aaa-go02-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-go02-sea-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "SG01" = {
      "autoaccount_name" = "aaa-sg01-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-sg01-sea-p-autom01-rb01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "HK01" = {
      "autoaccount_name" = "aaa-hk01-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-hk01-sea-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "AU01" = {
      "autoaccount_name" = "aaa-au01-aue-p-autom01-rb01"
      "autoaccount_rg"   = "rg-au01-aue-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "DP01" = {
      "autoaccount_name" = "aaa-dp01-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-dp01-sea-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "ID01" = {
      "autoaccount_name" = "aaa-id01-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-id01-sea-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "KH01" = {
      "autoaccount_name" = "aaa-kh01-eas-p-autom01-rb01"
      "autoaccount_rg"   = "rg-kh01-eas-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "LK01" = {
      "autoaccount_name" = "aaa-lk01-eas-p-autom01-rb01"
      "autoaccount_rg"   = "rg-lk01-eas-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "MM01" = {
      "autoaccount_name" = "aaa-mm01-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-mm01-sea-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "MY01" = {
      "autoaccount_name" = "aaa-my01-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-my01-sea-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "PH01" = {
      "autoaccount_name" = "aaa-ph01-eas-p-autom01-rb01"
      "autoaccount_rg"   = "rg-ph01-eas-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "TH01" = {
      "autoaccount_name" = "aaa-th01-sea-p-autom01-rb01"
      "autoaccount_rg"   = "rg-th01-sea-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "TS01" = {
      "autoaccount_name" = "aaa-ts01-eas-p-autom01-rb01"
      "autoaccount_rg"   = "rg-ts01-eas-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    },
    "VN01" = {
      "autoaccount_name" = "aaa-vn01-eas-p-autom01-rb01"
      "autoaccount_rg"   = "rg-vn01-eas-p-infrasvc01-autom01"
      "autoaccount_rbook"= "CCOEStartStop-VM"
    }    
  }
}


locals {
  recovery_env = lower(var.environment) == "r" ? "r" : lower(var.environment) == "p" ? "p" : "n"
  recovery_vault = format("%s_%s_%s", upper(var.subscription), var.region, local.recovery_env)
  recovery_vault_selected =  var.recovery_vault[local.recovery_vault]
}

variable "recovery_vault" {
  default = {
    "GO01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-go01-eas-p-landingzone01-backup01"
      "recoveryvault_rg"     = "rg-go01-eas-p-landingzone01-rsv01"
      "recoveryvault_policy" = "rsv-go01-eas-p-landingzone01-backup-midnight-general-policy"
    },
    "GO01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-go01-eas-p-landingzone01-backup01"
      "recoveryvault_rg"     = "rg-go01-eas-p-landingzone01-rsv01"
      "recoveryvault_policy" = "rsv-go01-eas-p-landingzone01-backup-midnight-general-policy"
    },
    "GO01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-go01-eas-p-landingzone01-backup01"
      "recoveryvault_rg"     = "rg-go01-eas-p-landingzone01-rsv01"
      "recoveryvault_policy" = "rsv-go01-eas-p-landingzone01-backup-midnight-general-policy"
    },
    "GO01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-go01-sea-p-landingzone01-backup01"
      "recoveryvault_rg"     = "rg-go01-sea-p-landingzone01-rsv01"
      "recoveryvault_policy" = "rsv-go01-sea-p-landingzone01-backup-midnight-general-policy"
    },
    "GO01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-go01-sea-p-landingzone01-backup01"
      "recoveryvault_rg"     = "rg-go01-sea-p-landingzone01-rsv01"
      "recoveryvault_policy" = "rsv-go01-sea-p-landingzone01-backup-midnight-general-policy"
    },
    "GO01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-go01-sea-p-landingzone01-backup01"
      "recoveryvault_rg"     = "rg-go01-sea-p-landingzone01-rsv01"
      "recoveryvault_policy" = "rsv-go01-sea-p-landingzone01-backup-midnight-general-policy"
    },
    "GO02_eastasia_p" = {
      "recoveryvault_name"   = "rsv-go02-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-go02-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-go02-eas-p-infrasvc01-basic-general-policy"
    },
    "GO02_eastasia_r" = {
      "recoveryvault_name"   = "rsv-go02-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-go02-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-go02-eas-p-infrasvc01-basic-general-policy"
    },
    "GO02_eastasia_n" = {
      "recoveryvault_name"   = "rsv-go02-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-go02-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-go02-eas-p-infrasvc01-basic-general-policy"
    },
    "GO02_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-go02-sea-p-general-backup01"
      "recoveryvault_rg"     = "rg-go02-sea-p-general-backup"
      "recoveryvault_policy" = "rsv-go02-sea-p-infrasvc01-basic-general-policy"
    },
    "GO02_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-go02-sea-p-general-backup01"
      "recoveryvault_rg"     = "rg-go02-sea-p-general-backup"
      "recoveryvault_policy" = "rsv-go02-sea-p-infrasvc01-basic-general-policy"
    },
    "GO02_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-go02-sea-p-general-backup01"
      "recoveryvault_rg"     = "rg-go02-sea-p-general-backup"
      "recoveryvault_policy" = "rsv-go02-sea-p-infrasvc01-basic-general-policy"
    },
    "SG01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-sg01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-sg01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-sg01-eas-p-infrasvc01-basic-general-policy"
    },
    "SG01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-sg01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-sg01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-sg01-eas-p-infrasvc01-basic-general-policy"
    },
    "SG01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-sg01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-sg01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-sg01-eas-p-infrasvc01-basic-general-policy"
    },
    "SG01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-sg01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-sg01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-sg01-sea-p-infrasvc01-basic-general-policy"
    },
    "SG01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-sg01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-sg01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-sg01-sea-p-infrasvc01-basic-general-policy"
    },
    "SG01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-sg01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-sg01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-sg01-sea-p-infrasvc01-basic-general-policy"
    },
    "AV01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-av01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-av01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-av01-eas-p-infrasvc01-midnight-general-policy"
    },
    "AV01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-av01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-av01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-av01-eas-p-infrasvc01-midnight-general-policy"
    },
    "AV01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-av01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-av01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-av01-eas-p-infrasvc01-midnight-general-policy"
    },
    "HK01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-hk01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-hk01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-hk01-eas-p-infrasvc01-backup-midnight-general-policy"
    },
    "HK01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-hk01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-hk01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-hk01-eas-p-infrasvc01-backup-midnight-general-policy"
    },
    "HK01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-hk01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-hk01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-hk01-eas-p-infrasvc01-backup-midnight-general-policy"
    },
    "HK01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-hk01-sea-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-hk01-sea-r-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "HK01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-hk01-sea-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-hk01-sea-r-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "HK01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-hk01-sea-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-hk01-sea-r-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "VN01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-vn01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-vn01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-vn01-eas-p-infrasvc01-basic-general-policy"
    },
    "VN01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-vn01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-vn01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-vn01-eas-p-infrasvc01-basic-general-policy"
    },
    "VN01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-vn01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-vn01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-vn01-eas-p-infrasvc01-basic-general-policy"
    },
    "VN01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-vn01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-vn01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-vn01-sea-p-infrasvc01-midnight-general-policy"
    },
    "VN01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-vn01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-vn01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-vn01-sea-p-infrasvc01-midnight-general-policy"
    },
    "VN01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-vn01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-vn01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-vn01-sea-p-infrasvc01-midnight-general-policy"
    },
    "KH01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-kh01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-kh01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-kh01-eas-p-infrasvc01-basic-general-policy"
    },
    "KH01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-kh01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-kh01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-kh01-eas-p-infrasvc01-basic-general-policy"
    },
    "KH01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-kh01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-kh01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-kh01-eas-p-infrasvc01-basic-general-policy"
    },
    "KH01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-kh01-sea-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-kh01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "KH01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-kh01-sea-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-kh01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "KH01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-kh01-sea-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-kh01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "MY01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-my01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-MY01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-my01-eas-p-infrasvc01-basic-general-policy"
    },
    "MY01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-my01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-MY01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-my01-eas-p-infrasvc01-basic-general-policy"
    },
    "MY01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-my01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-MY01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-my01-eas-p-infrasvc01-basic-general-policy"
    },
    "MY01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-my01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-MY01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-my01-sea-p-infrasvc01-basic-general-policy"
    },
    "MY01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-my01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-MY01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-my01-sea-p-infrasvc01-basic-general-policy"
    },
    "MY01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-my01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-MY01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-my01-sea-u-infrasvc01-D42W13M13Y02"
    },
    "PH01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-ph01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ph01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ph01-eas-p-infrasvc01-midnight-general-policy"
    },
    "PH01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-ph01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ph01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ph01-eas-p-infrasvc01-midnight-general-policy"
    },
    "PH01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-ph01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ph01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ph01-eas-p-infrasvc01-midnight-general-policy"
    },
    "PH01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-ph01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ph01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ph01-sea-p-infrasvc01-midnight-general-policy"
    },
    "PH01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-ph01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ph01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ph01-sea-p-infrasvc01-midnight-general-policy"
    },
    "PH01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-ph01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ph01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ph01-sea-p-infrasvc01-midnight-general-policy"
    },
    "TS01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-ts01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ts01-eas-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ts01-eas-p-infrasvc01-midnight-general-policy"
    },
    "TS01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-ts01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ts01-eas-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ts01-eas-p-infrasvc01-midnight-general-policy"
    },
    "TS01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-ts01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ts01-eas-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ts01-eas-p-infrasvc01-midnight-general-policy"
    },
    "TS01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-ts01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ts01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ts01-sea-p-infrasvc01-general-policy"
    },
    "TS01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-ts01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ts01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ts01-sea-p-infrasvc01-general-policy"
    },
    "TS01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-ts01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-ts01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-ts01-sea-p-infrasvc01-general-policy"
    },
    "TH01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-th01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-th01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-th01-eas-r-jumphost-basic-general-policy"  
    },
    "TH01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-th01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-th01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-th01-eas-r-jumphost-basic-general-policy"
    },
    "TH01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-th01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-th01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-th01-eas-r-jumphost-basic-general-policy"
    },
    "TH01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-th01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-th01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-th01-sea-p-infrasvc01-midnight-general-policy"
    },
    "TH01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-th01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-th01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-th01-sea-p-infrasvc01-midnight-general-policy"
    },
    "TH01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-th01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-th01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-th01-sea-p-infrasvc01-midnight-general-policy"
    },
    "LK01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-lk01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-lk01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-lk01-eas-p-infrasvc01-D14W00M06Y01"
    },
    "LK01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-lk01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-lk01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-lk01-eas-p-infrasvc01-D14W00M06Y01"
    },
    "LK01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-lk01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-lk01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-lk01-eas-p-infrasvc01-D14W00M06Y01"
    },
    "LK01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-lk01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-lk01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-lk01-sea-p-infrasvc01-D14W00M06Y01"
    },
    "LK01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-lk01-sea-n-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-lk01-sea-n-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-lk01-sea-n-infrasvc01-D14W00M00Y00"
    },
    "LK01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-lk01-sea-n-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-lk01-sea-n-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-lk01-sea-n-infrasvc01-D14W00M00Y00"
    },
    "MM01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-mm01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-mm01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-mm01-eas-r-infrasvc01-basic-general-policy"
    },
    "MM01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-mm01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-mm01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-mm01-eas-r-infrasvc01-basic-general-policy"
    },
    "MM01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-mm01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-mm01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-mm01-eas-r-infrasvc01-basic-general-policy"
    },
    "MM01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-mm01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-mm01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-mm01-sea-p-infrasvc01-basic-general-policy"
    },
    "MM01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-mm01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-mm01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-mm01-sea-p-infrasvc01-basic-general-policy"
    },
    "MM01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-mm01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-mm01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-mm01-sea-p-infrasvc01-basic-general-policy"
    },
    "DP01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-dp01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-dp01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-dp01-eas-p-infrasvc01-basic-general-policy"
    },
    "DP01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-dp01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-dp01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-dp01-eas-p-infrasvc01-basic-general-policy"
    },
    "DP01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-dp01-eas-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-dp01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-dp01-eas-p-infrasvc01-basic-general-policy"
    },
    "DP01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-dp01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-dp01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-dp01-sea-p-infrasvc01-basic-general-policy"
    },
    "DP01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-dp01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-dp01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-dp01-sea-p-infrasvc01-basic-general-policy"
    },
    "DP01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-dp01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-dp01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-dp01-sea-p-infrasvc01-basic-general-policy"
    },
    "ID01_eastasia_p" = {
      "recoveryvault_name"   = "rsv-id01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-id01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "ID01_eastasia_r" = {
      "recoveryvault_name"   = "rsv-id01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-id01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "ID01_eastasia_n" = {
      "recoveryvault_name"   = "rsv-id01-eas-p-infrasvc01-asr01"
      "recoveryvault_rg"     = "rg-id01-eas-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "DefaultPolicy"
    },
    "ID01_southeastasia_p" = {
      "recoveryvault_name"   = "rsv-id01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-id01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-id01-sea-p-infrasvc01-midnight-general-policy"
    },
    "ID01_southeastasia_r" = {
      "recoveryvault_name"   = "rsv-id01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-id01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-id01-sea-p-infrasvc01-midnight-general-policy"
    },
    "ID01_southeastasia_n" = {
      "recoveryvault_name"   = "rsv-id01-sea-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-id01-sea-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-id01-sea-p-infrasvc01-midnight-general-policy"
    },
    # "AU01_australiaeast" = {
    #   "recoveryvault_name"   = "rsv-au01-aue-p-infrasvc01-backup01"
    #   "recoveryvault_rg"     = "rg-AU01-aue-p-infrasvc01-rsv01"
    #   "recoveryvault_policy" = "rsv-au01-aue-p-infrasvc01-basic-general-policy"
    # },
    # "AU01_australiasoutheast" = {
    #   "recoveryvault_name"   = "rsv-au01-aus-p-infrasvc01-backup01"
    #   "recoveryvault_rg"     = "rg-id01-sea-p-infrasvc01-rsv01"
    #   "recoveryvault_policy" = "rsv-au01-aus-p-infrasvc01-basic-general-policy"
    # }
    "AU01_australiaeast_p" = {
      "recoveryvault_name"   = "rsv-au01-aue-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-AU01-aue-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-au01-aue-p-infrasvc01-basic-general-policy"
    },
    "AU01_australiaeast_r" = {
      "recoveryvault_name"   = "rsv-au01-aue-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-AU01-aue-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-au01-aue-p-infrasvc01-basic-general-policy"
    },
    "AU01_australiaeast_n" = {
      "recoveryvault_name"   = "rsv-au01-aue-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-AU01-aue-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-au01-aue-p-infrasvc01-nonprod-standard-policy"
    },
    "AU01_australiasoutheast_p" = {
      "recoveryvault_name"   = "rsv-au01-aus-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-AU01-aus-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-au01-aus-p-infrasvc01-basic-general-policy"
    },
    "AU01_australiasoutheast_r" = {
      "recoveryvault_name"   = "rsv-au01-aus-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-AU01-aus-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-au01-aus-p-infrasvc01-basic-general-policy"
    },
    "AU01_australiasoutheast_n" = {
      "recoveryvault_name"   = "rsv-au01-aus-p-infrasvc01-backup01"
      "recoveryvault_rg"     = "rg-AU01-aus-p-infrasvc01-rsv01"
      "recoveryvault_policy" = "rsv-au01-aus-p-infrasvc01-nonprod-standard-policy"
    }
  }
}

variable "tags" {
  description = "The tags to associate the resource we are creating"
  type        = map(string)
  default     = {}
}
variable "custm_mngdkey_encryp_datadisks" {}
/*
variable "custom_managedkey" {
  default = {
    "GO02_eastasia_p" = {
      "managedkeyvault_name"   = "kv-go02-eas-p-ade-vlt01"
      "managedkeyvault_rg"     = "rg-go02-eas-p-sec01-keyvault01"
      "managedkey_name"        = "kek-go02-eas-p-shared-ade01"
    },
    "GO02_eastasia_n" = {
      "managedkeyvault_name"   = "kv-go02-eas-n-ade-vlt01"
      "managedkeyvault_rg"     = "rg-go02-eas-n-sec01-keyvault01"
      "managedkey_name"        = "kek-go02-eas-n-shared-ade01"
    },
    "GO02_southeastasia_p" = {
      "managedkeyvault_name"   = "kv-go02-sea-p-ade-vlt01"
      "managedkeyvault_rg"     = "rg-go02-sea-p-sec01-keyvault01"
      "managedkey_name"        = "kek-go02-sea-p-shared-ade01"
    },
    "GO02_southeastasia_n" = {
      "managedkeyvault_name"   = "kv-go02-sea-n-ade-vlt01"
      "managedkeyvault_rg"     = "rg-go02-sea-n-sec01-keyvault01"
      "managedkey_name"        = "kek-go02-sea-n-shared-ade01"
    },
    "SG01_eastasia_p" = {
      "managedkeyvault_name"   = "kv-sg01-eas-p-ade-vlt01"
      "managedkeyvault_rg"     = "rg-sg01-eas-p-sharedsrv01-keyvault01"
      "managedkey_name"        = "kek-sg01-eas-p-shared-ade01"
    },
    "SG01_eastasia_n" = {
      "managedkeyvault_name"   = "kv-sg01-eas-n-ade-vlt01"
      "managedkeyvault_rg"     = "rg-sg01-eas-n-sharedsrv01-keyvault01"
      "managedkey_name"        = "kek-sg01-eas-n-shared-ade01"
    },
    "SG01_southeastasia_p" = {
      "managedkeyvault_name"   = "kv-sg01-sea-p-ade-vlt01"
      "managedkeyvault_rg"     = "rg-sg01-sea-p-coast"
      "managedkey_name"        =  "kek-sg01-sea-p-shared-ade01"
    },
    "SG01_southeastasia_n" = {
      "managedkeyvault_name"   = "kv-sg01-sea-n-ade-vlt01"
      "managedkeyvault_rg"     = "rg-sg01-sea-n-sharedsrv01-keyvault01"
      "managedkey_name"        = "kek-sg01-sea-n-shared-ade01"
    },
    "HK01_eastasia_p" = {
      "managedkeyvault_name"   = "kv-hk01-eas-p-ade-vlt01"
      "managedkeyvault_rg"     = "rg-hk01-eas-p-infrasvc01-keyvault01"
      "managedkey_name"        = "kek-hk01-eas-p-shared-ade01"
    },
    "HK01_eastasia_n" = {
      "managedkeyvault_name"   = "kv-hk01-eas-n-ade-vlt01"
      "managedkeyvault_rg"     = "rg-hk01-eas-n-infrasvc01-keyvault01"
      "managedkey_name"        = "kek-hk01-eas-n-shared-ade01"
    },
    "HK01_southeastasia_p" = {
      "managedkeyvault_name"   = "kv-hk01-sea-p-ade-vlt01"
      "managedkeyvault_rg"     = "rg-hk01-sea-p-infrasvc01-keyvault01"
      "managedkey_name"        = "kek-hk01-sea-p-shared-ade01"
    },
    "HK01_southeastasia_n" = {
      "managedkeyvault_name"   = "kv-hk01-sea-r-ade-vlt01"
      "managedkeyvault_rg"     = "rg-hk01-sea-r-infrasvc01-keyvault01"
      "managedkey_name"        = "kek-hk01-sea-r-shared-ade01"
    } 
  }
}
*/
variable "encryption_set_details" {
  default = {
    "av01_eastasia_n" = {
      "encryptionset_name" = "des-av01-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-av01-eas-n-encryptset"
    },
    "av01_eastasia_p" = {
      "encryptionset_name" = "des-av01-eas-p-encrypt01"
      "encryptionset_rg"   = "rg-av01-eas-p-encryptset"
    },
    "av01_southeastasia_r" = {
      "encryptionset_name" = "des-av01-sea-r-encrypt01"
      "encryptionset_rg"   = "rg-av01-sea-r-encryptset"
    },
    "go01_eastasia_n" = {
      "encryptionset_name" = "des-go01-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-go01-eas-n-encryptset"
    },
    "go01_eastasia_p" = {
      "encryptionset_name" = "des-go01-eas-p-encrypt01"
      "encryptionset_rg"   = "rg-go01-eas-p-encryptset"
    },
    "go01_southeastasia_r" = {
      "encryptionset_name" = "des-go01-sea-r-encrypt01"
      "encryptionset_rg"   = "rg-go01-sea-r-encryptset"
    },
    "go02_eastasia_p" = {
      "encryptionset_name" = "des-go02-eas-p-encrypt01"
      "encryptionset_rg"   = "rg-go02-eas-p-encryptset"
    },
    "go02_eastasia_n" = {
      "encryptionset_name" = "des-go02-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-go02-eas-n-encryptset01"
    },
    "go02_eastasia_r" = {
      "encryptionset_name" = "des-go02-eas-p-encrypt01"
      "encryptionset_rg"   = "rg-go02-eas-p-encryptset"
    },
    "go02_southeastasia_r" = {
      "encryptionset_name" = "des-go02-sea-r-encrypt01"
      "encryptionset_rg"   = "rg-go02-sea-r-encryptset"
    },
    "hk01_eastasia_n" = {
      "encryptionset_name" = "des-hk01-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-hk01-eas-n-encryptset"
    },
    "hk01_eastasia_p" = {
      "encryptionset_name" = "des-hk01-eas-p-encrypt01"
      "encryptionset_rg"   = "rg-hk01-eas-p-encryptset"
    },
    "hk01_southeastasia_r" = {
      "encryptionset_name" = "des-hk01-sea-r-encrypt01"
      "encryptionset_rg"   = "rg-hk01-sea-r-encryptset" 
    },
    "id01_eastasia_r" = {
      "encryptionset_name" = "des-id01-eas-r-encrypt01"
      "encryptionset_rg"   = "rg-id01-eas-r-encryptset"
    },
    "id01_southeastasia_n" = {
      "encryptionset_name" = "des-id01-sea-n-encrypt01"
      "encryptionset_rg"   = "rg-id01-sea-n-encryptset"
    },
    "id01_southeastasia_p" = {
      "encryptionset_name" = "des-id01-sea-p-encrypt01"
      "encryptionset_rg"   = "rg-id01-sea-p-encryptset"
    },
    "kh01_eastasia_n" = {
      "encryptionset_name" = "des-kh01-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-kh01-eas-n-encryptset"
    },
    "kh01_eastasia_p" = {
      "encryptionset_name" = "des-kh01-eas-p-encrypt01"
      "encryptionset_rg"   = "rg-kh01-eas-p-encryptset"
    },
    "kh01_southeastasia_r" = {
      "encryptionset_name" = "des-kh01-sea-r-encrypt01"
      "encryptionset_rg"   = "rg-kh01-sea-r-encryptset"
    },
    "lk01_eastasia_r" = {
      "encryptionset_name" = "des-lk01-eas-r-encrypt01"
      "encryptionset_rg"   = "rg-lk01-eas-r-encryptset"
    },
    "lk01_southeastasia_n" = {
      "encryptionset_name" = "des-lk01-sea-n-encrypt01"
      "encryptionset_rg"   = "rg-lk01-sea-n-encryptset"
    },
    "lk01_southeastasia_p" = {
      "encryptionset_name" = "des-lk01-sea-p-encrypt01"
      "encryptionset_rg"   = "rg-lk01-sea-p-encryptset"
    },
    "mm01_eastasia_r" = {
      "encryptionset_name" = "des-mm01-eas-r-encrypt01"
      "encryptionset_rg"   = "rg-mm01-eas-r-encryptset"
    },
    "mm01_southeastasia_n" = {
      "encryptionset_name" = "des-mm01-sea-n-encrypt01"
      "encryptionset_rg"   = "rg-mm01-sea-n-encryptset"
    },
    "mm01_southeastasia_p" = {
      "encryptionset_name" = "des-mm01-sea-p-encrypt01"
      "encryptionset_rg"   = "rg-mm01-sea-p-encryptset"
    },
    "my01_southeastasia_n" = {
      "encryptionset_name" = "des-my01-sea-n-encrypt01"
      "encryptionset_rg"   = "rg-my01-sea-n-encryptset"
    },
    "my01_southeastasia_p" = {
      "encryptionset_name" = "des-my01-sea-p-encrypt01"
      "encryptionset_rg"   = "rg-my01-sea-p-encryptset"
    },
    "ph01_eastasia_n" = {
      "encryptionset_name" = "des-ph01-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-ph01-eas-n-encryptset"
    },
    "ph01_eastasia_p" = {
      "encryptionset_name" = "des-ph01-eas-p-encrypt01"
      "encryptionset_rg"   = "rg-ph01-eas-p-encryptset"
    },
    "ph01_southeastasia_r" = {
      "encryptionset_name" = "des-ph01-sea-r-encrypt01"
      "encryptionset_rg"   = "rg-ph01-sea-r-encryptset"
    },
    "sg01_southeastasia_n" = {
      "encryptionset_name" = "des-sg01-sea-n-encrypt01"
      "encryptionset_rg"   = "rg-sg01-sea-n-encryptset"
    },
    "sg01_southeastasia_p" = {
      "encryptionset_name" = "des-sg01-sea-p-encrypt01"
      "encryptionset_rg"   = "rg-sg01-sea-p-encryptset"
    },
    "sg01_eastasia_r" = {
      "encryptionset_name" = "des-sg01-eas-r-encrypt01"
      "encryptionset_rg"   = "rg-sg01-eas-r-encryptset"
    },
    "th01_eastasia_r" = {
      "encryptionset_name" = "des-th01-eas-r-encrypt01"
      "encryptionset_rg"   = "rg-th01-eas-r-encryptset"
    },
    "th01_southeastasia_n" = {
      "encryptionset_name" = "des-th01-sea-n-encrypt01"
      "encryptionset_rg"   = "rg-th01-sea-n-encryptset"
    },
    "th01_southeastasia_p" = {
      "encryptionset_name" = "des-th01-sea-p-encrypt01"
      "encryptionset_rg"   = "rg-th01-sea-p-encryptset"
    },
    "ts01_eastasia_n" = {
      "encryptionset_name" = "des-ts01-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-ts01-eas-n-encryptset"
    },
    "vn01_eastasia_n" = {
      "encryptionset_name" = "des-vn01-eas-n-encrypt01"
      "encryptionset_rg"   = "rg-vn01-eas-n-encryptset"
    },
    "vn01_eastasia_r" = {
      "encryptionset_name" = "des-vn01-eas-r-encrypt01"
      "encryptionset_rg"   = "rg-vn01-eas-r-encryptset"
    },
    "vn01_southeastasia_p" = {
      "encryptionset_name" = "des-vn01-sea-p-encrypt01"
      "encryptionset_rg"   = "rg-vn01-sea-p-encryptset"
    },
    "au01_australiaeast_n" = {
      "encryptionset_name" = "des-au01-aue-n-encrypt01"
      "encryptionset_rg"   = "rg-au01-aue-n-encryptset01"
    },
    "au01_australiaeast_p" = {
      "encryptionset_name" = "des-au01-aue-p-encrypt01"
      "encryptionset_rg"   = "rg-au01-aue-p-encryptset01"
    },
    "au01_southeastasia_r" = {
      "encryptionset_name" = "des-au01-aus-r-encrypt01"
      "encryptionset_rg"   = "rg-au01-aus-r-encryptset01"
    },
    "au01_australiasoutheast_n" = {
      "encryptionset_name" = "des-au01-aus-r-encrypt01"
      "encryptionset_rg"   = "rg-au01-aus-r-encryptset01"
    },
    "au01_australiasoutheast_p" = {
      "encryptionset_name" = "des-au01-aus-r-encrypt01"
      "encryptionset_rg"   = "rg-au01-aus-r-encryptset01"
    }
  }
}

variable "systemidentity_required" {}

variable "datadisks_required" {}

# Data Disk Sizes
variable "Datadisksize_1" {}
variable "Datadisksize_2" {}
variable "Datadisksize_3" {}
variable "Datadisksize_4" {}
variable "Datadisksize_5" {}

# Data Disk Types
variable "Datadisktype_1" {}
variable "Datadisktype_2" {}
variable "Datadisktype_3" {}
variable "Datadisktype_4" {}
variable "Datadisktype_5" {}