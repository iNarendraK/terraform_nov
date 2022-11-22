# Day 2

## Changing the permission of pem file
```
chmod 400 ~/Downloads/ubuntu-vm1.pem
ssh -i ~/Downloads/ubuntu-vm1.pem azureuser@<public-ip-of-your-vm>
```

## Installing nginx web server in the Azure Ubuntu virtual machine
```
sudo apt update
sudo apt install -y nginx
sudo systemctl start nginx
curl localhost
```

## Firewall configuration

![Network Security Group](nsg.png)


## Lab - Creating an Ubuntu Virtual Machine using Terraform
```
cd ~/terraform-nov-2022
git pull

cd Day2/azure-vm
terraform init
terraform apply --auto-approve
```jegan@tektutor.org:~/terraform-nov-2022/Day2/azure-vm$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Reusing previous version of hashicorp/random from the dependency lock file
- Reusing previous version of hashicorp/tls from the dependency lock file
- Installing hashicorp/random v3.4.3...
- Installed hashicorp/random v3.4.3 (signed by HashiCorp)
- Installing hashicorp/tls v4.0.4...
- Installed hashicorp/tls v4.0.4 (signed by HashiCorp)
- Installing hashicorp/azurerm v2.99.0...
- Installed hashicorp/azurerm v2.99.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
jegan@tektutor.org:~/terraform-nov-2022/Day2/azure-vm$ 

jegan@tektutor.org:~/terraform-nov-2022/Day2/azure-vm$ terraform apply --auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_linux_virtual_machine.my_ubuntu_vm will be created
  + resource "azurerm_linux_virtual_machine" "my_ubuntu_vm" {
      + admin_username                  = "azureuser"
      + allow_extension_operations      = true
      + computer_name                   = "myvm"
      + disable_password_authentication = true
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "myUbuntuVM"
      + network_interface_ids           = (known after apply)
      + patch_mode                      = "ImageDefault"
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = (known after apply)
      + size                            = "Standard_DS1_v2"
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + admin_ssh_key {
          + public_key = (known after apply)
          + username   = "azureuser"
        }

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = "myHardDisk"
          + storage_account_type      = "Premium_LRS"
          + write_accelerator_enabled = false
        }

      + source_image_reference {
          + offer     = "UbuntuServer"
          + publisher = "Canonical"
          + sku       = "18.04-LTS"
          + version   = "latest"
        }
    }

  # azurerm_network_interface.my_nic will be created
  + resource "azurerm_network_interface" "my_nic" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "myNIC"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = (known after apply)
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + gateway_load_balancer_frontend_ip_configuration_id = (known after apply)
          + name                                               = "my_nic_configuration"
          + primary                                            = (known after apply)
          + private_ip_address                                 = (known after apply)
          + private_ip_address_allocation                      = "Dynamic"
          + private_ip_address_version                         = "IPv4"
          + public_ip_address_id                               = (known after apply)
          + subnet_id                                          = (known after apply)
        }
    }

  # azurerm_network_interface_security_group_association.nic_ngs_connector will be created
  + resource "azurerm_network_interface_security_group_association" "nic_ngs_connector" {
      + id                        = (known after apply)
      + network_interface_id      = (known after apply)
      + network_security_group_id = (known after apply)
    }

  # azurerm_network_security_group.my-nsg will be created
  + resource "azurerm_network_security_group" "my-nsg" {
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "myNetworkSecurityGroup"
      + resource_group_name = (known after apply)
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "22"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "SSH"
              + priority                                   = 1001
              + protocol                                   = "Tcp"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
    }

  # azurerm_public_ip.my_public_ip will be created
  + resource "azurerm_public_ip" "my_public_ip" {
      + allocation_method       = "Dynamic"
      + availability_zone       = (known after apply)
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "myPublicIP"
      + resource_group_name     = (known after apply)
      + sku                     = "Basic"
      + sku_tier                = "Regional"
      + zones                   = (known after apply)
    }

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = (known after apply)
    }

  # azurerm_subnet.my_subnet will be created
  + resource "azurerm_subnet" "my_subnet" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.0.1.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "mySubnet"
      + resource_group_name                            = (known after apply)
      + virtual_network_name                           = "my-virtual-net"
    }

  # azurerm_virtual_network.my_virtual_network will be created
  + resource "azurerm_virtual_network" "my_virtual_network" {
      + address_space         = [
          + "10.0.0.0/16",
        ]
      + dns_servers           = (known after apply)
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "eastus"
      + name                  = "my-virtual-net"
      + resource_group_name   = (known after apply)
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

  # random_pet.rg_name will be created
  + resource "random_pet" "rg_name" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "rg"
      + separator = "-"
    }

  # tls_private_key.my_ssh_key will be created
  + resource "tls_private_key" "my_ssh_key" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 10 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + public_ip_address   = (known after apply)
  + resource_group_name = (known after apply)
  + ssh_key             = (sensitive value)
  + tls_private_key     = (sensitive value)
random_pet.rg_name: Creating...
random_pet.rg_name: Creation complete after 0s [id=rg-nearby-muskox]
tls_private_key.my_ssh_key: Creating...
tls_private_key.my_ssh_key: Creation complete after 0s [id=3f634753ca28608c5312c7f26900b3c9a2187d3c]
azurerm_resource_group.rg: Creating...
azurerm_resource_group.rg: Creation complete after 4s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox]
azurerm_virtual_network.my_virtual_network: Creating...
azurerm_public_ip.my_public_ip: Creating...
azurerm_network_security_group.my-nsg: Creating...
azurerm_network_security_group.my-nsg: Creation complete after 9s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup]
azurerm_virtual_network.my_virtual_network: Still creating... [10s elapsed]
azurerm_public_ip.my_public_ip: Still creating... [10s elapsed]
azurerm_virtual_network.my_virtual_network: Creation complete after 12s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Network/virtualNetworks/my-virtual-net]
azurerm_subnet.my_subnet: Creating...
azurerm_public_ip.my_public_ip: Creation complete after 12s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Network/publicIPAddresses/myPublicIP]
azurerm_subnet.my_subnet: Creation complete after 8s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Network/virtualNetworks/my-virtual-net/subnets/mySubnet]
azurerm_network_interface.my_nic: Creating...
azurerm_network_interface.my_nic: Creation complete after 6s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Network/networkInterfaces/myNIC]
azurerm_network_interface_security_group_association.nic_ngs_connector: Creating...
azurerm_linux_virtual_machine.my_ubuntu_vm: Creating...
azurerm_network_interface_security_group_association.nic_ngs_connector: Creation complete after 6s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Network/networkInterfaces/myNIC|/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Network/networkSecurityGroups/myNetworkSecurityGroup]
azurerm_linux_virtual_machine.my_ubuntu_vm: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.my_ubuntu_vm: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.my_ubuntu_vm: Creation complete after 23s [id=/subscriptions/6ee542a8-0314-472f-a628-625cfbfcc778/resourceGroups/rg-nearby-muskox/providers/Microsoft.Compute/virtualMachines/myUbuntuVM]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

public_ip_address = "172.173.248.67"
resource_group_name = "rg-nearby-muskox"
ssh_key = <sensitive>
tls_private_key = <sensitive>
</pre>

### Printing the ssh_key
```
cd ~/terraform-nov-2022
git pull
cd Day2/azure-vm

terraform output ssh_key > key.pem
chmod 400 ./key.pem 
ssh -i ./key.pem azureuser@172.173.248.67
```

Expected output
<pre>
jegan@tektutor.org:~/terraform-nov-2022/Day2/azure-vm$ terraform output ssh_key > key.pem
jegan@tektutor.org:~/terraform-nov-2022/Day2/azure-vm$ chmod 400 ./key.pem 
jegan@tektutor.org:~/terraform-nov-2022/Day2/azure-vm$ ssh -i ./key.pem azureuser@172.173.248.67
Welcome to Ubuntu 18.04.6 LTS (GNU/Linux 5.4.0-1094-azure x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Nov 22 09:54:42 UTC 2022

  System load:  0.01              Processes:           113
  Usage of /:   4.8% of 28.89GB   Users logged in:     0
  Memory usage: 5%                IP address for eth0: 10.0.1.4
  Swap usage:   0%


0 updates can be applied immediately.

New release '20.04.5 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Tue Nov 22 09:52:25 2022 from 220.158.159.224
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

azureuser@myvm:~$ exit
logout
Connection to 172.173.248.67 closed.
</pre>


## Lab - Creating multiple ubuntu VMS using Terraform count loop
```
cd ~/terraform-nov-2022
git pull
cd Day2/azure-multiple-vms

terraform init
terraform apply --auto-approve
```
