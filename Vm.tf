resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.functionapp.location
  resource_group_name = azurerm_resource_group.functionapp.name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.functionapp.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_network_security_group" "example" {
  name                = var.nsg_name
  location            = azurerm_resource_group.functionapp.location
  resource_group_name = azurerm_resource_group.functionapp.name


  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  #security_rule {
  #  name                       = "Allow-RDP"
  #  priority                   = 1002
  #  direction                  = "Inbound"
  #  access                     = "Allow"
  #  protocol                   = "Tcp"
  #  source_port_range          = "*"
  #  destination_port_range     = "3389"
  #  source_address_prefix      = "*"
  #  destination_address_prefix = "*"
# }
}

resource "azurerm_public_ip" "ubuntu" {
  name                = var.public_ip_name_ubuntu
  location            = azurerm_resource_group.functionapp.location
  resource_group_name = azurerm_resource_group.functionapp.name
  allocation_method   = "Dynamic"
}

#resource "azurerm_public_ip" "windows" {
#  name                = var.public_ip_name_windows
#  location            = azurerm_resource_group.functionapp.location
#  resource_group_name = azurerm_resource_group.functionapp.name
#  allocation_method   = "Dynamic"
#}

resource "azurerm_network_interface" "ubuntu" {
  name                = var.nic_name_ubuntu
  location            = azurerm_resource_group.functionapp.location
  resource_group_name = azurerm_resource_group.functionapp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ubuntu.id
  }

 # network_security_group_id = azurerm_network_security_group.example.id
}

#resource "azurerm_network_interface" "windows" {
#  name                = var.nic_name_windows
#  location            = azurerm_resource_group.functionapp.location
#  resource_group_name = azurerm_resource_group.functionapp.name

#  ip_configuration {
#    name                          = "internal"
#    subnet_id                     = azurerm_subnet.example.id
#    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id          = azurerm_public_ip.windows.id
#  }

#  network_security_group_id = azurerm_network_security_group.example.id
#}

resource "azurerm_virtual_machine" "ubuntu" {
  name                  = var.vm_name_ubuntu
  location              = azurerm_resource_group.functionapp.location
  resource_group_name   = azurerm_resource_group.functionapp.name
  network_interface_ids = [azurerm_network_interface.ubuntu.id]
  vm_size               = var.vm_size_ubuntu

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "example-os-disk-ubuntu"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname-ubuntu"
    admin_username = var.admin_username_ubuntu
    admin_password = var.admin_password_ubuntu
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

#resource "azurerm_virtual_machine" "windows" {
#  name                  = var.vm_name_windows
#  location              = azurerm_resource_group.functionapp.location
#  resource_group_name   = azurerm_resource_group.functionapp.name
#  network_interface_ids = [azurerm_network_interface.windows.id]
#  vm_size               = var.vm_size_windows

#  storage_image_reference {
#    publisher = "MicrosoftWindowsServer"
#    offer     = "WindowsServer"
#    sku       = "2019-Datacenter"
#    version   = "latest"
#  }

#  storage_os_disk {
#    name              = "example-os-disk-windows"
#    caching           = "ReadWrite"
#    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
#  }

#  os_profile {
#    computer_name  = "hostname-windows"
#    admin_username = var.admin_username_windows
#    admin_password = var.admin_password_windows
#  }

#  os_profile_windows_config {}
#}