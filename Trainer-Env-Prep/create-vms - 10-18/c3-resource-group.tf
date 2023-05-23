resource "azurerm_resource_group" "rg" {
  name = "${var.business_unit}-${var.environment}-${var.resoure_group_name}"
  location = var.resoure_group_location
}