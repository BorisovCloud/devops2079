module "naming" {
  source = "Azure/naming/azurerm"
  suffix = ["${var.workspace_suffix[terraform.workspace]}"]
}

resource "azurerm_resource_group" "example-rg" {
  name     = module.naming.resource_group.name_unique
  location = "West Europe"
}

resource "azurerm_storage_account" "example-storage" {
  name                            = module.naming.storage_account.name_unique
  resource_group_name             = azurerm_resource_group.example-rg.name
  location                        = azurerm_resource_group.example-rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
  tags                            = var.tags
  network_rules {
    default_action = "Deny"
    ip_rules       = toset([trimspace(data.http.my_ip.response_body)])
  }
  lifecycle {
    ignore_changes = all
  }
}