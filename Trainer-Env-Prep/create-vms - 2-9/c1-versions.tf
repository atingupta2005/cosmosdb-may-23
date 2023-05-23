terraform {
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = "3.57.0"
  }
}
}

provider "azurerm" {
  subscription_id = "02cdb919-e534-40c3-9aec-38b0c587cd8d"
  features {}
}
