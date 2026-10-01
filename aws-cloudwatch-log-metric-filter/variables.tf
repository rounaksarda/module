variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the metric filter"
  type        = string
}

variable "pattern" {
  description = "CloudWatch Logs filter pattern"
  type        = string
}

variable "log_group_name" {
  description = "Name of the log group to associate the metric filter with"
  type        = string
}

variable "apply_on_transformed_logs" {
  description = "Whether to apply the filter on transformed logs"
  type        = bool
  default     = false
}

variable "metric_transformation" {
  description = "Metric transformation definition"
  type = object({
    name           = string
    namespace      = string
    value          = string
    default_value  = optional(number)
    dimensions     = optional(map(string))
    unit           = optional(string)
  })
}