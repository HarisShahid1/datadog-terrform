module "cpu_monitor" {
  source                    = "../../modules/cpu_monitor"
  aws_region                = var.aws_region
  secretsmanager_secret_id  = var.secretsmanager_secret_id
  cpu_threshold             = var.cpu_threshold
  monitor_tags              = var.monitor_tags
  alert_message             = var.alert_message
}
