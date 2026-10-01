variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

# Required
variable "topic_arn" {
  description = "ARN of the SNS topic to subscribe to"
  type        = string
}

variable "protocol" {
  description = "Protocol to use (sqs, lambda, firehose, sms, email, http, https, etc.)"
  type        = string
}

variable "endpoint" {
  description = "Endpoint to send data to"
  type        = string
}

# Required only for firehose
variable "subscription_role_arn" {
  description = "IAM role ARN required for firehose subscriptions"
  type        = string
  default     = null
}

# Optional
variable "confirmation_timeout_in_minutes" {
  description = "Timeout for confirming http/https subscriptions"
  type        = number
  default     = null
}

variable "delivery_policy" {
  description = "Delivery policy JSON (HTTP/S only)"
  type        = string
  default     = null
}

variable "endpoint_auto_confirms" {
  description = "Whether endpoint auto-confirms subscription"
  type        = bool
  default     = false
}

variable "filter_policy" {
  description = "Filter policy JSON"
  type        = string
  default     = null
}

variable "filter_policy_scope" {
  description = "Scope of filter policy (MessageAttributes or MessageBody)"
  type        = string
  default     = null
}

variable "raw_message_delivery" {
  description = "Enable raw message delivery"
  type        = bool
  default     = false
}

variable "redrive_policy" {
  description = "Redrive policy JSON (DLQ)"
  type        = string
  default     = null
}

variable "replay_policy" {
  description = "Replay policy JSON (archived messages)"
  type        = string
  default     = null
}