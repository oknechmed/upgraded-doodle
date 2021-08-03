data "template_file" "user_data" {
  template = file("${path.module}/config/cloud_init.cfg")
}

data "template_file" "network_config" {
  template = file("${path.module}/config/centos7.cfg")
}

data "template_file" "network_config_two" {
  template = file("${path.module}/config/centos7two.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit.iso"
  pool           = libvirt_volume.centos7-qcow2.pool
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
}

# resource "libvirt_cloudinit_disk" "commoninit_two" {
#   name           = "commoninit_two.iso"
#   pool           = libvirt_volume.centos7-qcow2-two.pool
#   user_data      = data.template_file.user_data.rendered
#   network_config = data.template_file.network_config_two.rendered
# }