# Configure the Azure provider
terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.60"
    }
    /*
    azuread = {
      source  = "hashicorp/azuread"
      version = "=1.3.0"
    }*/
  }
}

