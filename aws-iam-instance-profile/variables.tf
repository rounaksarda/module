variable "name" {
  description = "Name of the IAM instance profile."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Name prefix for the IAM instance profile."
  type        = string
  default     = null
}

variable "path" {
  description = "Path of the IAM instance profile."
  type        = string
  default     = "/"
}

variable "role" {
  description = "IAM role name to associate with the instance profile."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the instance profile."
  type        = map(string)
  default     = {}
}
