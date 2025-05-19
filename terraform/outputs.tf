###
#   Outputs wie IP-Adresse und DNS Name

output "ip_control-plane-1" {
  value = try(
    format(
      "%s.%s",
      replace(join(".", slice(split("-", var.vpn), 0, 3)), "-", "."),
      element(slice(split("-", maas_vm_instance.control-plane-1.hostname), 1, 2), 0)
    ),
    maas_vm_instance.control-plane-1.ip_addresses
  )
  description = "The IP address of the server instance."
}

output "fqdn_control-plane-1" {
  value       = "${maas_vm_instance.control-plane-1.hostname}.maas"
  description = "The FQDN of the server instance."
}


output "fqdn_control-plane-2" {
  value       = "${maas_vm_instance.control-plane-2.hostname}.maas"
  description = "The FQDN of the server instance."
}

output "ip_control-plane-2" {
  value = try(
    format(
      "%s.%s",
      replace(join(".", slice(split("-", var.vpn), 0, 3)), "-", "."),
      element(slice(split("-", maas_vm_instance.control-plane-2.hostname), 1, 2), 0)
    ),
    maas_vm_instance.control-plane-2.ip_addresses
  )
  description = "The IP address of the server instance."
}


output "fqdn_control-plane-3" {
  value       = "${maas_vm_instance.control-plane-3.hostname}.maas"
  description = "The FQDN of the server instance."
}

output "ip_control-plane-3" {
  value = try(
    format(
      "%s.%s",
      replace(join(".", slice(split("-", var.vpn), 0, 3)), "-", "."),
      element(slice(split("-", maas_vm_instance.control-plane-3.hostname), 1, 2), 0)
    ),
    maas_vm_instance.control-plane-3.ip_addresses
  )
  description = "The IP address of the server instance."
}

output "intro" {
  value = templatefile("INTRO.md", {
    ip   = element(tolist(maas_vm_instance.control-plane-1.ip_addresses), 0)
    fqdn = "${maas_vm_instance.control-plane-1.hostname}.maas"
    }
  )
}