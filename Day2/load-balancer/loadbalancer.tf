resource "azurerm_public_ip" "lb_public_ip" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "my_lb" {
  name                = "MyLoadBalancer"
  sku                 = "Standard"
  sku_tier            = "Regional"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  loadbalancer_id = azurerm_lb.my_lb.id
  name            = "LBBackEndAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "vm_backend" {
  count=3
  network_interface_id = azurerm_network_interface.my_nic.*.id[count.index]
  ip_configuration_name= azurerm_network_interface.my_nic.*.ip_configuration.0.name[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend.id
  depends_on = [
    azurerm_linux_virtual_machine.my_ubuntu_vm
  ]
}

resource "azurerm_lb_rule" "lb_forward_port_80_traffic_rule" {
  loadbalancer_id = azurerm_lb.my_lb.id
  name                           = "LBRule"
  backend_address_pool_ids       = [ azurerm_lb_backend_address_pool.lb_backend.id ]
  protocol                       = "Tcp"
  frontend_port                  = 80 
  backend_port                   = 80 
  frontend_ip_configuration_name = "PublicIPAddress"
}
