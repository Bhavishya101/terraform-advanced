output "LinuxVM_Name" {
  value = module.Linux_VM.linux_vm-name
  description = "Name of newly launched windows virtual machine"
}

output "systemidentity_id" {
  value = module.Linux_VM.systemidentity_id
  description = "id of system managed identity"
}

output "LinuxVM_PrivateIP" {
  value = module.Linux_VM.Private_IPaddress
  description = "Private IP address of the VM"
}