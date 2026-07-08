output "public_ip" {
  value = azurerm_linux_virtual_machine.this.public_ip_address
}

output "private_key_pem" {
  value     = tls_private_key.ssh.private_key_pem
  sensitive = true
}

output "admin_username" {
  value = var.admin_username
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}
