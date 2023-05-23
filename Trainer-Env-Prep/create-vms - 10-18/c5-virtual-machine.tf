resource "azurerm_windows_virtual_machine" "myvm" {
  count = var.vm_count
  name                = "AZ-VM-00-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.rg.*.id[count.index],
  ]
os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type
  }
source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-21h2-pro"
    version   = "latest"
  }

user_data   = filebase64("userdata.txt")
}


resource "azurerm_dev_test_global_vm_shutdown_schedule" "vmshutdown" {
  count = var.vm_count
  virtual_machine_id = azurerm_windows_virtual_machine.myvm.*.id[count.index]
  location           = azurerm_windows_virtual_machine.myvm.*.location[count.index]
  enabled            = true

  daily_recurrence_time = "1400"
  timezone              = "India Standard Time"


  notification_settings {
    enabled         = false
  }
}


