# resource "azurerm_resource_group" "rg" {
#   name     = "rg-demo"
#   location = "East US"
#   tags     = var.tags
# }

data "azurerm_resource_group" "rg" {
  name = "rg-demo"
}

# resource "azurerm_storage_account" "storage" {
#   name                            = random_pet.pet.id
#   resource_group_name             = azurerm_resource_group.rg.name
#   location                        = azurerm_resource_group.rg.location
#   account_tier                    = "Standard"
#   account_replication_type        = "LRS"
#   allow_nested_items_to_be_public = false
#   tags                            = var.tags
#   network_rules {
#     default_action = "Deny"
#     ip_rules       = toset([trimspace(data.http.my_ip.response_body)])
#   }
#   lifecycle {
#     ignore_changes = all
#   }
# }

# resource "azurerm_resource_group" "rg2" {
#   location = "eastus"
#   name     = "rg-demo2"
#   tags = {
#     "environment" = "demooooo"
#     "owner"       = "demo owner"
#   }
# }