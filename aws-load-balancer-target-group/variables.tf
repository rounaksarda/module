variable "region" {
  description = "Region override"
  type        = string
  default     = null
}

variable "name" {
  type    = string
  default = null
}

variable "name_prefix" {
  type    = string
  default = null
}

variable "port" {
  type    = number
  default = null
}

variable "protocol" {
  type    = string
  default = null
}

variable "protocol_version" {
  type    = string
  default = null
}

variable "vpc_id" {
  type    = string
  default = null
}

variable "target_type" {
  type    = string
  default = "instance"
}

variable "ip_address_type" {
  type    = string
  default = null
}

variable "connection_termination" {
  type    = bool
  default = false
}

variable "deregistration_delay" {
  type    = number
  default = 300
}

variable "lambda_multi_value_headers_enabled" {
  type    = bool
  default = false
}

variable "load_balancing_algorithm_type" {
  type    = string
  default = "round_robin"
}

variable "load_balancing_anomaly_mitigation" {
  type    = string
  default = "off"
}

variable "load_balancing_cross_zone_enabled" {
  type    = string
  default = "use_load_balancer_configuration"
}

variable "preserve_client_ip" {
  type    = bool
  default = null
}

variable "proxy_protocol_v2" {
  type    = bool
  default = false
}

variable "slow_start" {
  type    = number
  default = 0
}

variable "tags" {
  type    = map(string)
  default = {}
}

############################################################
# HEALTH CHECK
############################################################

variable "health_check" {
  type = object({
    enabled             = optional(bool, true)
    healthy_threshold   = optional(number, 3)
    unhealthy_threshold = optional(number, 3)
    interval            = optional(number, 30)
    timeout             = optional(number)
    protocol            = optional(string)
    path                = optional(string)
    port                = optional(string, "traffic-port")
    matcher             = optional(string)
  })
  default = null
}

############################################################
# STICKINESS
############################################################

variable "stickiness" {
  type = object({
    enabled         = optional(bool, true)
    type            = string
    cookie_duration = optional(number, 86400)
    cookie_name     = optional(string)
  })
  default = null
}

############################################################
# TARGET FAILOVER (GWLB)
############################################################

variable "target_failover" {
  type = object({
    on_deregistration = optional(string, "no_rebalance")
    on_unhealthy      = optional(string, "no_rebalance")
  })
  default = null
}

############################################################
# TARGET HEALTH STATE (NLB)
############################################################

variable "target_health_state" {
  type = object({
    enable_unhealthy_connection_termination = optional(bool, true)
    unhealthy_draining_interval             = optional(number, 0)
  })
  default = null
}

############################################################
# TARGET GROUP HEALTH
############################################################

variable "target_group_health" {
  type = object({
    dns_failover = optional(object({
      minimum_healthy_targets_count      = optional(string)
      minimum_healthy_targets_percentage = optional(string)
    }))

    unhealthy_state_routing = optional(object({
      minimum_healthy_targets_count      = optional(number, 1)
      minimum_healthy_targets_percentage = optional(string)
    }))
  })
  default = null
}
