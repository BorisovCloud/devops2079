# data "azurerm_ssh_public_key" "my_key" {
#   name                = "my-key"
#   resource_group_name = data.azurerm_resource_group.rg.name
# }

# resource "azurerm_virtual_network" "vm_vnet_provisioner" {
#   name                = "${random_pet.pet.id}-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   tags                = var.tags
# }

# resource "azurerm_subnet" "vm_subnet_provisioner" {
#   name                 = "${random_pet.pet.id}-subnet"
#   resource_group_name  = data.azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vm_vnet_provisioner.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# resource "azurerm_public_ip" "vm_pip_provisioner" {
#   name                = "${random_pet.pet.id}-pip"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   allocation_method   = "Static"
#   tags                = var.tags
# }

# resource "azurerm_network_security_group" "vm_nsg_provisioner" {
#   name                = "${random_pet.pet.id}-nsg"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   tags                = var.tags

#   security_rule {
#     name                       = "allow-ssh"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "${trimspace(data.http.my_ip.response_body)}/32"
#     destination_address_prefix = "*"
#   }

#   security_rule {
#     name                       = "allow-http"
#     priority                   = 200
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "80"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_interface" "vm_nic_provisioner" {
#   name                = "${random_pet.pet.id}-nic"
#   location            = data.azurerm_resource_group.rg.location
#   resource_group_name = data.azurerm_resource_group.rg.name
#   tags                = var.tags

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.vm_subnet_provisioner.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.vm_pip_provisioner.id
#   }
# }

# resource "azurerm_network_interface_security_group_association" "vm_nic_nsg_provisioner" {
#   network_interface_id      = azurerm_network_interface.vm_nic_provisioner.id
#   network_security_group_id = azurerm_network_security_group.vm_nsg_provisioner.id
# }

# resource "azurerm_linux_virtual_machine" "vm_provisioner" {
#   name                  = "${random_pet.pet.id}-${var.vm_name_provisioner}"
#   resource_group_name   = data.azurerm_resource_group.rg.name
#   location              = data.azurerm_resource_group.rg.location
#   size                  = var.vm_size
#   admin_username        = var.admin_username
#   network_interface_ids = [azurerm_network_interface.vm_nic_provisioner.id]
#   tags                  = var.tags

#   admin_ssh_key {
#     username   = var.admin_username
#     public_key = data.azurerm_ssh_public_key.my_key.public_key
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

#   connection {
#     type        = "ssh"
#     user        = self.admin_username
#     host        = self.public_ip_address
#     private_key = file("~/Downloads/my-key.pem")
#   }

#   provisioner "file" {
#     source      = "cloud.sh"
#     destination = "/tmp/cloud.sh"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/cloud.sh", 
#       "/tmp/cloud.sh"
#     ]
#   }

#   provisioner "local-exec" {
#     command = "echo ${azurerm_public_ip.vm_pip_provisioner.ip_address} > my-vm-ip.txt"
#   }

#   provisioner "local-exec" {
#     when = destroy
#     command = "rm my-vm-ip.txt"
#   }

#   provisioner "remote-exec" {
#     when = destroy
#     on_failure = fail
#     inline = [
#       "echo '<!doctype html><html><body><h1>VM is being destroyed</h1><p>Shalom! Destroy-time provisioner completed successfully.</p></body></html>' | sudo tee /var/www/html/index.html",
#       "sudo systemctl restart nginx",
#       "sleep 30"
#     ]
#   }
# }

# output "vm_public_ip" {
#   value = azurerm_public_ip.vm_pip_provisioner.ip_address
# }
