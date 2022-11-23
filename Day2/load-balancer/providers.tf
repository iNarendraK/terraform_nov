terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.32.0"
    }
    random = {
        source = "hashicorp/random"
        version = "=3.4.3"
    }

    tls = {
        source = "hashicorp/tls"
        version = "4.0.4"
    }
 }
}

provider "azurerm" {
  features {
     virtual_machine {
        delete_os_disk_on_deletion = true
        graceful_shutdown          = false
        skip_shutdown_and_force_delete = true
     }
  }
}
