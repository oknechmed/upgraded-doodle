resource "libvirt_network" "vm_default" {
  name   = var.vm_network_names["vm_eth0"]
  mode   = "bridge"
  bridge = "virbr0"
  dhcp {
    enabled = true
  }
}

resource "libvirt_network" "vm_ansible" {
  name      = var.vm_network_names["vm_eth1"]
  addresses = var.vm_ansible_cidr
  dhcp {
    enabled = false
  }
}
