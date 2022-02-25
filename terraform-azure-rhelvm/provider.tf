terraform {
  required_version = ">=0.15"
  required_providers {
    azurerm = {
      version = "=2.56.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias = "GO01"
  subscription_id = "e8569be2-1379-4a99-a535-b2dc6b90757f"
  skip_provider_registration = true
  features {}
}