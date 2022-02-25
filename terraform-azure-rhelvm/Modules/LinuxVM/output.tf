output "linux_vm-id" {
  value = azurerm_linux_virtual_machine.LinuxVM.id
}

output "linux_vm-name" {
  value = azurerm_linux_virtual_machine.LinuxVM.name
}

output "systemidentity_id" {
  value = azurerm_linux_virtual_machine.LinuxVM.identity
}

output "Private_IPaddress" {
  value = azurerm_linux_virtual_machine.LinuxVM.private_ip_address
}