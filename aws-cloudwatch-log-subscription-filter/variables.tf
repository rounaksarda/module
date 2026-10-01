variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the subscription filter"
  type        = string
}

variable "log_group_name" {
  description = "Name of the log group to associate the subscription filter with"
  type        = string
}

variable "filter_pattern" {
  description = "Valid CloudWatch Logs filter pattern. Use empty string to match all events"
  type        = string
}

variable "destination_arn" {
  description = "ARN of the destination (Kinesis stream or Lambda function)"
  type        = string
}

variable "distribution" {
  description = "Distribution method for Kinesis destinations"
  type        = string
  default     = null
}

variable "emit_system_fields" {
  description = "List of system fields to include in forwarded log events"
  type        = list(string)
  default     = null
}

variable "apply_on_transformed_logs" {
  description = "Whether to apply the filter on transformed logs"
  type        = bool
  default     = false
}

variable "role_arn" {
  description = "IAM role ARN for CloudWatch Logs to deliver events"
  type        = string
  default     = null
}