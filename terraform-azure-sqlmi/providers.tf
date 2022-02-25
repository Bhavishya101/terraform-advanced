# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.82.0"

    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias = "GO01"
  subscription_id = "e8569be2-1379-4a99-a535-b2dc6b90757f"
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  alias = "SG01"
  subscription_id = "97849348-0525-4007-9d79-11ada732dfcc"
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  alias = "HK01"
  subscription_id = "9b491dd6-598e-498c-98a0-d3bbd2290821"
  skip_provider_registration = true
  features {}
}