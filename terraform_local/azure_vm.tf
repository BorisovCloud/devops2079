# resource "azurerm_virtual_network" "vm_vnet" {
#   name                = "${var.vm_name}-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   tags                = var.tags
# }

# resource "azurerm_subnet" "vm_subnet" {
#   name                 = "${var.vm_name}-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vm_vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_public_ip" "vm_pip" {
#   name                = "${var.vm_name}-pip"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
#   tags                = var.tags
# }

# resource "azurerm_network_security_group" "vm_nsg" {
#   name                = "${var.vm_name}-nsg"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   tags                = var.tags

#   security_rule {
#     name                       = "allow-ssh"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "${var.allowed_ssh_ip}/32"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_interface" "vm_nic" {
#   name                = "${var.vm_name}-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   tags                = var.tags

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.vm_subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.vm_pip.id
#   }
# }

# resource "azurerm_network_interface_security_group_association" "vm_nic_nsg" {
#   network_interface_id      = azurerm_network_interface.vm_nic.id
#   network_security_group_id = azurerm_network_security_group.vm_nsg.id
# }

# resource "azurerm_linux_virtual_machine" "vm" {
#   name                = var.vm_name
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   size                = var.vm_size
#   admin_username      = var.admin_username
#   network_interface_ids = [
#     azurerm_network_interface.vm_nic.id,
#   ]
#   tags = var.tags

#   disable_password_authentication = true

#   admin_ssh_key {
#     username   = var.admin_username
#     public_key = var.admin_ssh_public_key
#   }

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts-gen2"
#     version   = "latest"
#   }
# }

# output "vm_public_ip" {
#   value       = azurerm_public_ip.vm_pip.ip_address
#   description = "Public IP address of the Linux VM"
# }
