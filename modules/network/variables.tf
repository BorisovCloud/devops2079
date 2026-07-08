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

variable "ssh_source_address" {
  description = "Source address prefix allowed for SSH access"
  type        = string
  default     = "*"
}

