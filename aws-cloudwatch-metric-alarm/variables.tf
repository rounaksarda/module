variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "alarm_name" {
  description = "The descriptive name for the alarm"
  type        = string
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold"
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
}

variable "metric_name" {
  type    = string
  default = null
}

variable "namespace" {
  type    = string
  default = null
}

variable "period" {
  type    = number
  default = null
}

variable "statistic" {
  type    = string
  default = null
}

variable "extended_statistic" {
  type    = string
  default = null
}

variable "threshold" {
  type    = number
  default = null
}

variable "threshold_metric_id" {
  type    = string
  default = null
}

variable "actions_enabled" {
  type    = bool
  default = true
}

variable "alarm_actions" {
  type    = list(string)
  default = []
}

variable "ok_actions" {
  type    = list(string)
  default = []
}

variable "insufficient_data_actions" {
  type    = list(string)
  default = []
}

variable "alarm_description" {
  type    = string
  default = null
}

variable "datapoints_to_alarm" {
  type    = number
  default = null
}

variable "dimensions" {
  type    = map(string)
  default = {}
}

variable "unit" {
  type    = string
  default = null
}

variable "treat_missing_data" {
  type    = string
  default = "missing"
}

variable "evaluate_low_sample_count_percentiles" {
  type    = string
  default = null
}

variable "metric_query" {
  description = "Metric math or Metrics Insights queries"
  type = list(object({
    id          = string
    account_id = optional(string)
    expression = optional(string)
    label       = optional(string)
    period      = optional(number)
    return_data = optional(bool)

    metric = optional(object({
      metric_name = string
      namespace   = string
      period      = number
      stat        = string
      unit        = optional(string)
      dimensions  = optional(map(string))
    }))
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}