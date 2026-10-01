variable "region" {
  description = "Region where the resource will be managed"
  type        = string
  default     = null
}


# REQUIRED

variable "action" {
  description = "Lambda action to allow in this statement"
  type        = string
}

variable "function_name" {
  description = "Name or ARN of Lambda function"
  type        = string
}

variable "principal" {
  description = "Service or account invoking Lambda"
  type        = string
}

# OPTIONAL

variable "statement_id" {
  type    = string
  default = null
}

variable "statement_id_prefix" {
  type    = string
  default = null
}

variable "source_arn" {
  description = "Source resource ARN"
  type        = string
  default     = null
}

variable "source_account" {
  type    = string
  default = null
}

variable "principal_org_id" {
  type    = string
  default = null
}

variable "qualifier" {
  description = "Lambda version or alias"
  type        = string
  default     = null
}

variable "event_source_token" {
  type    = string
  default = null
}

variable "function_url_auth_type" {
  type    = string
  default = null
}

variable "invoked_via_function_url" {
  type    = bool
  default = null
}