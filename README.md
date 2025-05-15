# Datadog Monitor Terraform Module

This Terraform project provisions a Datadog monitor for high CPU usage using the Datadog Terraform provider.

## Datadog Credentials

This project pulls the Datadog API and APP keys from AWS Secrets Manager. Store your credentials as a JSON object in a secret:

```json
{
  "datadog_api_key": "your_actual_api_key",
  "datadog_app_key": "your_actual_app_key"
}
```

## Features

- Provisions a CPU (and more) usage monitor(s) using a Datadog metric alert.
- Parameters for threshold, tags, and alert message.
- Supports customizable tags and messages.

## Usage

```hcl
module "cpu_monitor" {
  source                    = "github.com/HarisShahid1/datadog-monitor-terraform//modules/cpu_monitor"
  aws_region                = "us-east-1"
  secretsmanager_secret_id  = "datadog-api-keys"
  cpu_threshold             = 85
  monitor_tags              = ["env:staging", "team:backend"]
  alert_message             = "Staging CPU usage exceeds threshold. Investigate immediately."
}
```