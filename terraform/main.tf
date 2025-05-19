###
#   Ressourcen
#

# All KVM Hosts
#data "maas_vm_hosts" "default" {
#  id = "default"
#}

# My KVM Host
data "maas_vm_host" "default" {
  name = terraform.workspace
}

resource "maas_vm_instance" "control-plane-1" {

  kvm_no    = data.maas_vm_host.default.no
  hostname  = "cna-${terraform.workspace}-cp1"
  cpu_count = 8
  memory    = 10240
  storage   = 64

  user_data = templatefile(var.userdata, {})

  zone = var.vpn
}

resource "maas_vm_instance" "control-plane-2" {

  kvm_no    = data.maas_vm_host.default.no
  hostname  = "cna-${terraform.workspace}-cp2"
  cpu_count = 8
  memory    = 10240
  storage   = 64

  user_data = templatefile(var.userdata-worker, {})

  zone = var.vpn
}

resource "maas_vm_instance" "control-plane-3" {

  kvm_no    = data.maas_vm_host.default.no
  hostname  = "cna-${terraform.workspace}-cp3"
  cpu_count = 8
  memory    = 10240
  storage   = 64

  user_data = templatefile(var.userdata-worker, {})

  zone = var.vpn
}



