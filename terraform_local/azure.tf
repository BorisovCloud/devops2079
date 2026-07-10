# module "web_vm" {
#   source              = "../modules/vm"
#   name                = "web-server"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   location            = data.azurerm_resource_group.rg.location
# }

# module "app_vm" {
#   source              = "../modules/vm"
#   name                = "app-server"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
# }

# resource "azurerm_resource_group" "rg" {
#   name     = "rg-app-server"
#   location = "East US"
#   tags     = var.tags
# }

# data "azurerm_resource_group" "rg" {
#   name = "rg-demo"
# }

# resource "azurerm_resource_group" "rg2" {
#   location = "eastus"
#   name     = "rg-demo2"
#   tags = {
#     "environment" = "demooooo"
#     "owner"       = "demo owner"
#   }
# }