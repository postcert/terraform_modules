# Proxmox

variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
  default     = "https://192.168.1.10:8006/api2/json"
}

variable "proxmox_node" {
  description = "Proxmox node"
  type        = string
}

variable "proxmox_storage" {
  description = "Proxmox storage"
  type        = string
  default     = "data"
}

# VM

variable "name" {
  description = "VM name"
  type        = string
}

variable "description" {
  description = "VM description"
  type        = string
  default     = ""
}

variable "source_template" {
  description = "VM template to clone"
  type        = string
  default     = "debian12-cloudinit"
}

# Sizing

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Maximum amount of memory in MB"
  type        = number
  default     = 4096
}

variable "balloon" {
  description = "Minimum amount of memory in MB"
  type        = number
  default     = 2048
}

variable "disk_gb" {
  description = "Size (in GB) of root disk size in the format xG"
  type        = string
  default     = "16G"
}

# Configuration

variable "sshkeys" {
  description = "SSH keys to add to the VM"
  type        = list(string)
  default     = []
}

variable "net_address" {
  description = "IP address to assign to the VM"
  type        = string
}

variable "user" {
  description = "Name for the default user account"
  type        = string
  default     = "user"
}

variable "password" {
  description = "Password for the default user account"
  type        = string
  default     = null
}

# Provisioning (If Needed)

variable "prov_private_key" {
  description = "Private key to use for provisioning"
  type        = string
  default     = null
}

variable "prov_user" {
  description = "User to use for provisioning"
  type        = string
  default     = null
}

# Defaults

variable "full_clone" {
  description = "Whether to perform a full clone (instead of a linked clone)"
  type        = bool
  default     = true
}

variable "start_on_create" {
  description = "Whether to start the VM immediately after creation"
  type        = bool
  default     = true
}

variable "start_on_host_boot" {
  description = "Whether to start the VM when the host boots"
  type        = bool
  default     = true
}

variable "custom_vm_id" {
  description = "Id to use for the VM"
  type        = number
  default     = 0 # 0 means auto-assign
}

variable "net_gateway" {
  description = "Default network gateway"
  type        = string
  default     = "192.168.1.1"
}

variable "net_cidr" {
  description = "CIDR size for the network"
  type        = string
  default     = "21"
}

variable "net_bridge" {
  description = "Bridge to use for the network"
  type        = string
  default     = "vmbr0"
}

# Annoying Defaults
# A lot of these values simply exist because the terraform provider will overwrite the template's setup

variable "scsihw" {
  description = "SCSI controller model"
  type        = string
  default     = "virtio-scsi-pci"
}

variable "disk_type" {
  description = "Disk type for root disk"
  type        = string
  default     = "virtio"
}

variable "nic_type" {
  description = "NIC type"
  type        = string
  default     = "virtio"
}

# Seems to still be "enabled" on the cloned VMs
# When enabled the provider waits for guest-agent to discover the vm IP
# TODO: Get qemu-guest-agent into templated base instead of after
variable "qemu_guest_agent" {
  description = "Whether to enable QEMU guest agent interactions from Proxmox"
  type        = bool
  default     = false
}

variable "bios" {
  description = "BIOS type"
  type        = string
  default     = "ovmf"
}
