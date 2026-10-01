variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the log stream"
  type        = string
}

variable "log_group_name" {
  description = "The name of the log group under which the log stream is created"
  type        = string
}