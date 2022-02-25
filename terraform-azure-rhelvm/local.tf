locals {
  automation_account_selected = var.automation_account[upper(var.subscription)]
  av_set_id = var.availabilityset_name == "" ? null : var.create_availability_set ? module.availability_set[0].availability_set_id : data.azurerm_availability_set.av_set.0.id
  encryption_env = lower(var.environment) == "r"  ? "r" : lower(var.environment) =="p" ? "p" : "n"
  encryption_set_identifier = format("%s_%s_%s", lower(var.subscription), lower(var.region), local.encryption_env)
  encryption_set_selected = try(var.encryption_set_details[local.encryption_set_identifier], var.encryption_set_details[format("%s_%s_%s", lower(var.subscription), lower(var.region), "r")])
  ansible_tower = var.ansible_tower_env == "uat" ? "https://aiaansibletower-uat.aia.biz" : "https://aiaansibletower.aia.biz/"
  worksflow_job_template = var.ansible_tower_env == "uat" ? 55 : 80
  inventory_id = var.ansible_tower_env == "uat" ? 11 : lookup(var.inventory_id_map, upper(var.subscription))
  credential_id = var.ansible_tower_env == "uat" ? 8 : lookup(var.credential_id_map, upper(var.subscription))
}