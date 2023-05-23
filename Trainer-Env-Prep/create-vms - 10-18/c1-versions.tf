terraform {
required_providers {
  azurerm = {
    source = "hashicorp/azurerm"
    version = "3.57.0"
  }
}
}

provider "azurerm" {
  subscription_id = "f22f6f07-9e0b-47e3-bc12-f333f88d9d70"
  features {}
}
