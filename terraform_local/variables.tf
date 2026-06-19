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

variable "vm_name_provisioner" {
  description = "Name of the Linux virtual machine."
  type        = string
  default     = "demo-vm-provisioner"
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

variable "admin_password" {
  description = "Admin password for the VM."
  type        = string
  sensitive   = true

  validation {
    condition = (
      (can(regex("[a-z]", var.admin_password)) ? 1 : 0) +
      (can(regex("[A-Z]", var.admin_password)) ? 1 : 0) +
      (can(regex("[0-9]", var.admin_password)) ? 1 : 0) +
      (can(regex("[^a-zA-Z0-9_]", var.admin_password)) ? 1 : 0)
    ) >= 3
    error_message = "Password must meet at least 3 of: lowercase, uppercase, digit, special character (not '_')."
  }
}

variable "allowed_ssh_ip" {
  description = "IP address allowed to access SSH port 22."
  type        = string
  default     = "1.1.1.1"
}