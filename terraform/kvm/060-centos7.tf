resource "libvirt_volume" "centos7_os_image" {
  name   = "centos7 os image"
  pool   = "default"
  source = var.centos_7_img_url
}

resource "libvirt_volume" "centos7-qcow2" {
  name   = "centos7-qcow"
  pool   = "default"
  size   = "32212254720"
  format = "qcow2"
}

resource "libvirt_domain" "domain-centos" {
  name       = var.vm_hostname
  memory     = "1024"
  vcpu       = 1
  qemu_agent = true
  cloudinit  = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_id     = libvirt_network.vm_default.id
    network_name   = var.vm_network_names["vm_eth0"]
    hostname       = var.vm_hostname
    wait_for_lease = true
  }

  network_interface {
    network_id     = libvirt_network.vm_ansible.id
    network_name   = var.vm_network_names["vm_eth1"]
    hostname       = var.vm_hostname
    addresses      = ["172.16.12.12"]
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.centos7_os_image.id
  }

  disk {
    volume_id = libvirt_volume.centos7-qcow2.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }

  provisioner "remote-exec" {
    inline = ["uptime"]

    connection {
      type     = "ssh"
      user     = "root"
      password = "rpassword"
      host     = "172.16.12.12"
    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook ../../ansible/ansible_playbooks/terra_zones/deploy.yml -i hosts -e target='terra_centos7'"
  }
}
