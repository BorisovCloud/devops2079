variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resources."
  default = {
    "owner"       = "demo owner",
    "environment" = "demo"
  }

}

variable "vm_name" {
  description = "Name of the Linux virtual machine."
  type        = string
  default     = "demo-vm"
}

variable "vm_size" {
  description = "Azure VM size."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for SSH access."
  type        = string
  default     = "azureuser"
}

# variable "admin_ssh_public_key" {
#   description = "SSH public key used to authenticate to the VM."
#   type        = string
# }

variable "allowed_ssh_ip" {
  description = "IP address allowed to access SSH port 22."
  type        = string
  default     = "37.232.79.65"
}