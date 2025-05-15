variable "aws_region" {
  description = "AWS region for Secrets Manager"
  type        = string
  default     = "us-east-1"
}

variable "secretsmanager_secret_id" {
  description = "Name or ARN of the AWS Secrets Manager secret"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU usage threshold for alert"
  type        = number
  default     = 80
}

variable "monitor_tags" {
  description = "Tags for the monitor"
  type        = list(string)
  default     = ["env:dev", "team:infra"]
}

variable "alert_message" {
  description = "Alert message for the monitor"
  type        = string
  default     = "CPU usage is above threshold. Please investigate."
}
