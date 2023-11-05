# Going to want to set the needed AUTH env variables
# export PM_USER="someuser@pam"
# export PM_PASS="somepassword"

terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.1.10:8006/api2/json"
}

module "vm" {
  source = "../"

  name         = "test-vm"
  net_address  = "192.168.5.5"
  proxmox_node = "post7000"

  password = "password"

  providers = {
    proxmox = proxmox
  }
}
