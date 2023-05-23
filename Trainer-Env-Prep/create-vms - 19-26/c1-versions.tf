terraform {
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = "3.57.0"
  }
}
}

provider "azurerm" {
  subscription_id = "5c85b89f-7d4c-414b-a2bb-4f606235e954"
  features {}
}
