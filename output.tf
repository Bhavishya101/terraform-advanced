output "WindowsVM_Name" {
  value = module.Windows_VM.windows_vm-name
  description = "Name of newly launched windows virtual machine"
}

output "systemidentity_id" {
  value = module.Windows_VM.systemidentity_id
  description = "id of system managed identity"
}

output "WindowsVM_PrivateIP" {
  value = module.Windows_VM.Private_IPaddress
  description = "Private IP address of the VM"
}

output "WindowsVM_id" {
  value = module.Windows_VM.windows_vm-id
  description = "Virtual Machine ID"
}