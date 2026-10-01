variable "region" {
  description = "Region where this resource will be managed."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the Elastic Beanstalk application. Must be unique within the account."
  type        = string
}

variable "description" {
  description = "Short description of the application."
  type        = string
  default     = null
}

variable "tags" {
  description = "Key-value map of tags."
  type        = map(string)
  default     = {}
}

# ---- Application Version Lifecycle ----

variable "appversion_lifecycle" {
  description = "Application version lifecycle configuration."
  type = object({
    service_role           = string
    max_count              = optional(number)
    max_age_in_days        = optional(number)
    delete_source_from_s3  = optional(bool, false)
  })
  default = null

  validation {
    condition = (
      var.appversion_lifecycle == null ||
      (
        !(try(var.appversion_lifecycle.max_count, null) != null &&
          try(var.appversion_lifecycle.max_age_in_days, null) != null)
      )
    )
    error_message = "Only one of max_count or max_age_in_days can be specified."
  }
}
