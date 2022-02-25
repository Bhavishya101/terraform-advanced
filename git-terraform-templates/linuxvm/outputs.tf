output "LinuxVM_Name" {
  value = module.linuxvm.LinuxVM_Name
  description = "Name of newly launched windows virtual machine"
}

output "systemidentity_id" {
  value = module.linuxvm.systemidentity_id
  description = "id of system managed identity"
}

output "LinuxVM_PrivateIP" {
  value = module.linuxvm.LinuxVM_PrivateIP
  description = "Private IP address of the VM"
}