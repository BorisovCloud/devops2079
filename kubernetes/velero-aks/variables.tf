variable "owner" {
  description = "Short owner name (lowercase letters and digits, 3-10 chars)."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,10}$", var.owner))
    error_message = "owner must be 3-10 lowercase letters or digits (it becomes part of a storage account name)."
  }
}

variable "subscription_id" {
  description = "Azure subscription to deploy into (the course uses \"DevOps test\")."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "eastus"
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version."
  type        = string
  default     = "1.35"
}

variable "node_vm_size" {
  description = "VM size of the single AKS node (2 vCPU, 8 GiB)."
  type        = string
  default     = "Standard_D2s_v6"
}

variable "node_count" {
  description = "Number of AKS nodes."
  type        = number
  default     = 1
}
