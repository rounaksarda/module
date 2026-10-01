variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the log group"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  type        = string
  default     = null
}

variable "skip_destroy" {
  description = "Whether to skip deletion of the log group at destroy time"
  type        = bool
  default     = false
}

variable "deletion_protection_enabled" {
  description = "Whether deletion protection is enabled"
  type        = bool
  default     = false
}

variable "log_group_class" {
  description = "Log group class: STANDARD, INFREQUENT_ACCESS, or DELIVERY"
  type        = string
  default     = null
}

variable "retention_in_days" {
  description = "Number of days to retain log events"
  type        = number
  default     = null
}

variable "kms_key_id" {
  description = "KMS key ARN used to encrypt log data"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to assign to the log group"
  type        = map(string)
  default     = {}
}