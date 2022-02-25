locals {
  #utostop_time  = format("%sT19:00:00Z", formatdate("YYYY-MM-DD", timeadd(timestamp(),"24h")))
  #autostart_time = format("%sT08:00:00Z", formatdate("YYYY-MM-DD", timeadd(timestamp(),"24h")))
  current_time            = timestamp()
  start_clock_time        = "00.00"
  stop_clock_time         = "11.00"
  current_clock_time      = formatdate("hh.mm", local.current_time)
  check_stop_time         = (local.current_clock_time >= "10.50" && local.current_clock_time <= "11.10")
  schedule_start_tomorrow = (local.current_clock_time >= local.start_clock_time)
  schedule_stop_tomorrow  = (local.current_clock_time >= local.stop_clock_time)
  today                   = formatdate("YYYY-MM-DD", local.current_time)
  tomorrow                = formatdate("YYYY-MM-DD", timeadd(local.current_time, "24h"))
  autostart_time          = "${local.schedule_start_tomorrow ? local.tomorrow : local.today}T00:00:00Z"
  autostop_time           = "${local.check_stop_time ? local.tomorrow : local.schedule_stop_tomorrow ? local.tomorrow : local.today}T11:00:00Z"
  timeout_mins            = "30m"
}

resource "azurerm_automation_schedule" "autoshutdown" {
  name                    = var.autoshutdown_schedule_name
  resource_group_name     = var.automationacc_rg
  automation_account_name = var.automationacc_name
  frequency               = "Week"
  week_days               = ["Monday", "Tuesday", "Wednesday","Thursday", "Friday"]
  timezone                = var.autostopstart_timezone
  start_time              = local.autostop_time
  description             = "Run on weekdays to shutdown server at scheduled stop time"

  lifecycle {
    ignore_changes= [
      start_time,
    ]
  }
  timeouts {
    create = local.timeout_mins
    delete = local.timeout_mins
  }
}

resource "azurerm_automation_schedule" "autostart" {
  name                    = var.autostart_schedule_name
  resource_group_name     = var.automationacc_rg
  automation_account_name = var.automationacc_name
  frequency               = "Week"
  week_days               = ["Monday", "Tuesday", "Wednesday","Thursday", "Friday"]
  timezone                = var.autostopstart_timezone
  start_time              = local.autostart_time
  description             = "Run on weekdays to start server at scheduled start time"

  lifecycle {
    ignore_changes= [
      start_time,
    ]
  }
  timeouts {
    create = local.timeout_mins
    delete = local.timeout_mins
  }
}

resource "azurerm_automation_job_schedule" "autostop_job" {
  resource_group_name     = var.automationacc_rg
  automation_account_name = var.automationacc_name
  runbook_name            = var.autorunbook_name
  schedule_name           = azurerm_automation_schedule.autoshutdown.name

  parameters = {
    azuresubscriptionid   = "${var.subscription_id}"
    azurevmlist           = "${var.vm_name}"
    action                = "Stop"
  }
  timeouts {
    create = local.timeout_mins
    delete = local.timeout_mins
  }
}

resource "azurerm_automation_job_schedule" "autostart_job" {
  resource_group_name     = var.automationacc_rg
  automation_account_name = var.automationacc_name
  runbook_name            = var.autorunbook_name
  schedule_name           = azurerm_automation_schedule.autostart.name

  parameters = {
    azuresubscriptionid   = "${var.subscription_id}"
    azurevmlist           = "${var.vm_name}"
    action                = "Start"
  }
  timeouts {
    create = local.timeout_mins
    delete = local.timeout_mins
  }
}