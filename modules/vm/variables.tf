variable "name" {
  description = "Name prefix for all resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_source_address" {
  description = "Source address prefix allowed for SSH access"
  type        = string
  default     = "*"
}

variable "custom_data" {
  description = "Base64-encoded custom data (cloud-init) to pass to the VM"
  type        = string
  default     = null
}
