variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "name" {
  description = "SNS topic name (conflicts with name_prefix)"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "SNS topic name prefix (conflicts with name)"
  type        = string
  default     = null
}

variable "display_name" {
  description = "Display name for the topic"
  type        = string
  default     = null
}

variable "policy" {
  description = "SNS topic policy (JSON)"
  type        = string
  default     = null
}

variable "delivery_policy" {
  description = "SNS delivery policy (JSON)"
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "KMS key ID for encrypting SNS messages"
  type        = string
  default     = null
}

variable "signature_version" {
  description = "Signature version (1 or 2)"
  type        = number
  default     = null
}

variable "tracing_config" {
  description = "Tracing mode (PassThrough or Active)"
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Whether the topic is FIFO"
  type        = bool
  default     = false
}

variable "fifo_throughput_scope" {
  description = "FIFO throughput scope (Topic or MessageGroup)"
  type        = string
  default     = null
}

variable "content_based_deduplication" {
  description = "Enable content-based deduplication for FIFO topics"
  type        = bool
  default     = null
}

variable "archive_policy" {
  description = "Archive policy for FIFO topics (JSON)"
  type        = string
  default     = null
}

# Feedback roles & sampling

variable "application_success_feedback_role_arn" {
  type    = string
  default = null
}

variable "application_success_feedback_sample_rate" {
  type    = number
  default = null
}

variable "application_failure_feedback_role_arn" {
  type    = string
  default = null
}

variable "http_success_feedback_role_arn" {
  type    = string
  default = null
}

variable "http_success_feedback_sample_rate" {
  type    = number
  default = null
}

variable "http_failure_feedback_role_arn" {
  type    = string
  default = null
}

variable "lambda_success_feedback_role_arn" {
  type    = string
  default = null
}

variable "lambda_success_feedback_sample_rate" {
  type    = number
  default = null
}

variable "lambda_failure_feedback_role_arn" {
  type    = string
  default = null
}

variable "sqs_success_feedback_role_arn" {
  type    = string
  default = null
}

variable "sqs_success_feedback_sample_rate" {
  type    = number
  default = null
}

variable "sqs_failure_feedback_role_arn" {
  type    = string
  default = null
}

variable "firehose_success_feedback_role_arn" {
  type    = string
  default = null
}

variable "firehose_success_feedback_sample_rate" {
  type    = number
  default = null
}

variable "firehose_failure_feedback_role_arn" {
  type    = string
  default = null
}

variable "tags" {
  description = "Tags to assign to the SNS topic"
  type        = map(string)
  default     = {}
}