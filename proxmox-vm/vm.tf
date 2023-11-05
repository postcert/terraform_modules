resource "proxmox_vm_qemu" "vm" {
  target_node = var.proxmox_node
  desc        = var.description
  name        = var.name

  clone = var.source_template

  cores   = var.cores
  memory  = var.memory
  balloon = var.balloon

  agent  = var.qemu_guest_agent ? 1 : 0
  bios   = var.bios
  scsihw = var.scsihw

  disk {
    type    = var.disk_type
    storage = var.proxmox_storage
    size    = var.disk_gb
  }

  network {
    model  = var.nic_type
    bridge = var.net_bridge
  }

  # Cloud-init config
  cipassword = var.password
  ciuser     = var.user
  sshkeys    = join("\n", var.sshkeys)
  ipconfig0  = "ip=${var.net_address}/${var.net_cidr},gw=${var.net_gateway}"

  # Provisioning config
  ssh_private_key = var.prov_private_key
  ssh_user        = var.prov_user
}
