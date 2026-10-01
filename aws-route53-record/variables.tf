########################################
# Core Record Settings
########################################

variable "zone_id" {
  description = "Hosted zone ID"
  type        = string
}

variable "name" {
  description = "Record name"
  type        = string
}

variable "type" {
  description = "DNS record type"
  type        = string
}

variable "ttl" {
  description = "TTL for non-alias records"
  type        = number
  default     = null
}

variable "records" {
  description = "Record values for non-alias records"
  type        = list(string)
  default     = null
}

variable "allow_overwrite" {
  description = "Allow Terraform to overwrite an existing record"
  type        = bool
  default     = false
}

variable "set_identifier" {
  description = "Routing policy set identifier"
  type        = string
  default     = null
}

variable "health_check_id" {
  description = "Health check ID"
  type        = string
  default     = null
}

########################################
# Alias Record
########################################

variable "alias" {
  description = "Alias record configuration"
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
  default = null
}

########################################
# Routing Policies (Mutually Exclusive)
########################################

variable "cidr_routing_policy" {
  type = object({
    collection_id = string
    location_name = string
  })
  default = null
}

variable "failover_routing_policy" {
  type = object({
    type = string
  })
  default = null
}

variable "geolocation_routing_policy" {
  type = object({
    continent   = optional(string)
    country     = optional(string)
    subdivision = optional(string)
  })
  default = null
}

variable "geoproximity_routing_policy" {
  type = object({
    aws_region       = optional(string)
    bias             = optional(number)
    local_zone_group = optional(string)
    coordinates = optional(object({
      latitude  = number
      longitude = number
    }))
  })
  default = null
}

variable "latency_routing_policy" {
  type = object({
    region = string
  })
  default = null
}

variable "weighted_routing_policy" {
  type = object({
    weight = number
  })
  default = null
}

variable "multivalue_answer_routing_policy" {
  description = "Enable multivalue answer routing"
  type        = bool
  default     = false
}
