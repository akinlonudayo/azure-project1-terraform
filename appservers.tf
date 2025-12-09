resource "azurerm_linux_virtual_machine_scale_set" "business" {
  name                = "business-vmss"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_B2ms"
  instances           = 2
  admin_username      = var.admin_username

  source_image_reference {
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-jammy"
  sku       = "22_04-lts"
  version   = "latest"
}

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = tls_private_key.generated_ssh.public_key_openssh
  }

  network_interface {
    name    = "business-nic"
    primary = true
    ip_configuration {
      name      = "internal"
      subnet_id = azurerm_subnet.backend.id
      primary   = true
    }
  }
}
