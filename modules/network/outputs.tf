output "public_ip" {
  value = azurerm_public_ip.this.ip_address
}

output "azure_network_subnet_id" {
  value = azurerm_subnet.this.id
}

output "azure_public_ip_id" {
  value = azurerm_public_ip.this.id
}

output "azure_network_security_group_id" {
  value = azurerm_network_security_group.this.id
}