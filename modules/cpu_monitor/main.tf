provider "aws" {
  region = var.aws_region
}

data "aws_secretsmanager_secret_version" "datadog" {
  secret_id = var.secretsmanager_secret_id
}

locals {
  datadog_credentials = jsondecode(data.aws_secretsmanager_secret_version.datadog.secret_string)
}

provider "datadog" {
  api_key = local.datadog_credentials.datadog_api_key
  app_key = local.datadog_credentials.datadog_app_key
}

resource "datadog_monitor" "cpu_high" {
  name               = "High CPU Usage on Host"
  type               = "metric alert"
  query              = "avg(last_5m):avg:system.cpu.user{*} > ${var.cpu_threshold}"
  message            = var.alert_message
  tags               = var.monitor_tags
  escalation_message = "Escalation required: CPU usage is critical."

  thresholds {
    critical = var.cpu_threshold
  }

  notify_no_data    = true
  no_data_timeframe = 10
}
