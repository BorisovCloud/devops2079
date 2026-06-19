resource "azurerm_virtual_network" "vm_vnet_provisioner" {
  name                = "${var.vm_name_provisioner}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azurerm_subnet" "vm_subnet_provisioner" {
  name                 = "${var.vm_name_provisioner}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vm_vnet_provisioner.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "vm_pip_provisioner" {
  name                = "${var.vm_name_provisioner}-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  tags                = var.tags
}

resource "azurerm_network_security_group" "vm_nsg_provisioner" {
  name                = "${var.vm_name_provisioner}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "${var.allowed_ssh_ip}/32"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-http"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "vm_nic_provisioner" {
  name                = "${var.vm_name_provisioner}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet_provisioner.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip_provisioner.id
  }
}

resource "azurerm_network_interface_security_group_association" "vm_nic_nsg_provisioner" {
  network_interface_id      = azurerm_network_interface.vm_nic_provisioner.id
  network_security_group_id = azurerm_network_security_group.vm_nsg_provisioner.id
}

resource "azurerm_linux_virtual_machine" "vm_provisioner" {
  name                  = var.vm_name_provisioner
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  network_interface_ids = [azurerm_network_interface.vm_nic_provisioner.id]
  tags                  = var.tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDrqKFXdrT3lp6A0LAgfBLIuDJ8M21JgvKLmTMuQnRXU6DZ5E1mTH9Eo+N4CgHGBsXz/+QJWM0m/t76R57EC66fbFqlIrSHComCjSnxFOxUdIPwTTXucUmzTumOHNxOpFM62/tytKbmJxL0c+iXFzzQB7i4l3AiHzMZ3WI33CfvqZSIKr9MBntVBBcvsTYJD4Tbyx+wyXFeTl4y0qFSSMqW0JttIi7e0ZEyMWPmvmSkbXsm1M93rUUF3rJBQ+T/h+pgJrwrx2CvvdvOR62JCKniVYXDIlJCedw1CyJK3VYdpzQOwbQOFfpDyiZ8ka+booO1Q530bHllElOdKHmYyVRNce8d1vnUmLyRZYCVPykqZsssfm5rdDZX4aAPAhmgLVeq1UtZdrOtzFaDTeE8gMTkGI1BjPKdnse2iNPvQD67X12p+2pV26SwafaPsGuLxcdDGrBwa2+hZinYx0le+UXr7+RfjRIdZUsu7j8C2HteBCEdrrPvNNil+U/tUhrlYY0= generated-by-azure"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  connection {
    type        = "ssh"
    user        = var.admin_username
    host        = azurerm_public_ip.vm_pip_provisioner.ip_address
    private_key = file("~/Downloads/my-key.pem")
  }

  provisioner "file" {
    source      = "cloud.sh"
    destination = "/tmp/cloud.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/cloud.sh", 
      "/tmp/cloud.sh"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${azurerm_public_ip.vm_pip_provisioner.ip_address} > my-vm-ip.txt"
  }
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm_pip_provisioner.ip_address
}
