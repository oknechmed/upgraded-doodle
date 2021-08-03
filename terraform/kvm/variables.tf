variable "centos_7_img_url" {
  description = "centos 7 image"
  default     = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
}

variable "vm_hostname" {
  description = "vm hostname"
  default     = "terraform-centos"
}

variable "vm_hostname_two" {
  description = "vm hostname"
  default     = "terraform-centos-two"
}

variable "ssh_username" {
  description = "ssh username"
  default     = "terra"
}

variable "ssh_private_key" {
  description = "ssh private key"
  default     = "~/.ssh/id_rsa"
}

variable "vm_network_names" {
  type        = map(string)
  description = "vm network names"
  default = {
    "vm_eth0" = "vm_default"
    "vm_eth1" = "vm_ansible"
  }
}

variable "vm_ansible_cidr" {
  type        = list(string)
  description = "vm ansible cidr"
  default     = ["172.16.12.0/24"]
}
