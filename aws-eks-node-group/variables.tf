variable "cluster_name" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "node_group_name" {
  type    = string
  default = null
}

variable "node_group_name_prefix" {
  type    = string
  default = null
}

variable "ami_type" {
  type    = string
  default = null
}

variable "capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "disk_size" {
  type    = number
  default = null
}

variable "instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "release_version" {
  type    = string
  default = null
}

variable "kubernetes_version" {
  type    = string
  default = null
}

variable "force_update_version" {
  type    = bool
  default = null
}

variable "labels" {
  type    = map(string)
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "scaling_config" {
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
}

variable "update_config" {
  type = object({
    max_unavailable            = optional(number)
    max_unavailable_percentage = optional(number)
    update_strategy            = optional(string)
  })
  default = null
}

variable "remote_access" {
  type = object({
    ec2_ssh_key               = optional(string)
    source_security_group_ids = optional(list(string))
  })
  default = null
}

variable "launch_template" {
  type = object({
    id      = optional(string)
    name    = optional(string)
    version = string
  })
  default = null
}

variable "taints" {
  type = list(object({
    key    = string
    value  = optional(string)
    effect = string
  }))
  default = []
}

variable "node_repair_config" {
  type = object({
    enabled = optional(bool)

    max_parallel_nodes_repaired_count       = optional(number)
    max_parallel_nodes_repaired_percentage  = optional(number)

    max_unhealthy_node_threshold_count      = optional(number)
    max_unhealthy_node_threshold_percentage = optional(number)

    node_repair_config_overrides = optional(list(object({
      min_repair_wait_time_mins = number
      node_monitoring_condition = string
      node_unhealthy_reason     = string
      repair_action             = string
    })))
  })
  default = null
}