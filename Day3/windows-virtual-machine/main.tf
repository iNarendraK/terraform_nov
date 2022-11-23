resource "azurerm_resource_group" "rg" {
    location = var.resource_group_location
    name = "tektutor_rg"
}

resource "azurerm_virtual_network" "my_virtual_network" {
    name = "my-virtual-net"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "my_subnet" {
  name = "mySubnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.my_virtual_network.name
  address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "my_public_ip" {
  name = "myPublicIP"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Dynamic"    
}

resource "azurerm_network_security_group" "my-nsg" {
  name = "myNetworkSecurityGroup"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name = "AllowRDP"    
    priority = "1001"
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "3389"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name = "EnableICMP"    
    priority = "1002"
    direction = "Inbound"
    access = "Allow"
    protocol = "Icmp"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name = "AllowHttp"    
    priority = "1003"
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_network_interface" "my_nic" {
  name = "myNIC"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name = "my_nic_configuration"
    subnet_id = azurerm_subnet.my_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.my_public_ip.id
  }  
}

resource "azurerm_network_interface_security_group_association"  "nic_ngs_connector" {
  network_interface_id = azurerm_network_interface.my_nic.id
  network_security_group_id = azurerm_network_security_group.my-nsg.id
}

resource "azurerm_windows_virtual_machine" "my_windows_vm" {
  name = "myWindowsVM"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_nic.id]
  size = "Standard_DS1_v2"

  os_disk {
    name = "myHardDisk"
    caching = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2016-Datacenter"
    version = "latest"
  }

  computer_name = "myvm"
  admin_username = "azureuser"
  admin_password = "password@12345"
}
