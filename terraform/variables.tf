
# Zugriffs Informationen

variable "url" {
  description = "Evtl. URL fuer den Zugriff auf das API des Racks Servers"
  type        = string
}

variable "key" {
  description = "API Key, Token etc. fuer Zugriff"
  type        = string
  sensitive   = true
}

variable "vpn" {
  description = "Optional VPN welches eingerichtet werden soll"
  type        = string
  default     = "default"
}

variable "userdata" {
  description = "Cloud-init Script"
  type        = string
  default     = "cloud-init-cna.yaml"
}

variable "userdata-worker" {
  description = "Cloud-init Script"
  type        = string
  default     = "cloud-init-cnaworker.yaml"
}

