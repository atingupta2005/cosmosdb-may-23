# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "rg-${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "myvnetsubnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  count = var.vm_count
  name                = "mypublicip-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  domain_name_label = "vm-${var.business_unit}-${var.environment}-${var.dns_name_prefix}-${count.index}"
  tags = {
    environment = "Dev"
  }
}

resource "azurerm_network_interface" "rg" {
  count = var.vm_count
  name                = "AZ-VM-00-NIC-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
ip_configuration {
    name                          = "internal-${count.index}"
    subnet_id                     = azurerm_subnet.myvnetsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.*.id[count.index]
  }
}