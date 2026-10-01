variable "name" {
  description = "Name of the inline IAM role policy."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Name prefix for the inline IAM role policy."
  type        = string
  default     = null
}

variable "role" {
  description = "IAM role name or ID to attach the policy to."
  type        = string
}

variable "policy" {
  description = "JSON policy document."
  type        = string
}
