# The stand for topic 12: one Azure storage account that both clusters use as the Velero
# backup location, and an AKS cluster to restore into. The source cluster is the local
# minikube; it reaches the storage account over the internet with the account key.

resource "random_string" "suffix" {
  length  = 5
  upper   = false
  special = false
}

locals {
  name = "velero-${var.owner}"
  tags = {
    owner       = var.owner
    purpose     = "devops-course-velero"
    environment = "demo"
  }
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${local.name}"
  location = var.location
  tags     = local.tags
}

# --- Backup location: lives outside BOTH clusters ------------------------------------------

resource "azurerm_storage_account" "backups" {
  name                            = substr("stvelero${var.owner}${random_string.suffix.result}", 0, 24)
  resource_group_name             = azurerm_resource_group.this.name
  location                        = azurerm_resource_group.this.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = true # minikube has no Azure identity: Velero uses the account key
  tags                            = local.tags
}

resource "azurerm_storage_container" "velero" {
  name                  = "velero"
  storage_account_id    = azurerm_storage_account.backups.id # management plane: no data-plane auth needed
  container_access_type = "private"
}

# --- Restore target ------------------------------------------------------------------------

resource "azurerm_kubernetes_cluster" "this" {
  name                = "aks-${local.name}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "aks-${var.owner}"
  kubernetes_version  = var.kubernetes_version
  sku_tier            = "Free"

  default_node_pool {
    name       = "system"
    node_count = var.node_count
    vm_size    = var.node_vm_size

    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
  }

  tags = local.tags
}

# --- Velero credentials file, shared by both clusters --------------------------------------
# Format of velero-plugin-for-microsoft-azure for storage-account-key auth. Key auth covers
# the backup location only (no Azure disk snapshots): we back volumes up with fs-backup.

resource "local_sensitive_file" "velero_credentials" {
  filename        = "${path.module}/credentials-velero"
  file_permission = "0600"
  content         = <<-EOT
    AZURE_STORAGE_ACCOUNT_ACCESS_KEY=${azurerm_storage_account.backups.primary_access_key}
    AZURE_CLOUD_NAME=AzurePublicCloud
  EOT
}
