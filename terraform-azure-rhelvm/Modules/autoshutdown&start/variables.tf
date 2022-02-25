variable "vm_name" {}
variable "subscription_id" {}
variable "autoshutdown_schedule_name" {}
variable "autostart_schedule_name" {}
variable "autostopstart_timezone" {}
variable "automationacc_rg" {}
variable "automationacc_name" {}
variable "autorunbook_name" {}
variable "tags" {
  type = map(string)
}