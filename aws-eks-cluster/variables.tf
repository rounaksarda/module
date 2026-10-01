variable "name" {
  type = string
}

variable "role_arn" {
  type = string
}

variable "cluster_version" {
  type    = string
  default = null
}

variable "vpc_config" {
  type = object({
    subnet_ids              = list(string)
    endpoint_private_access = optional(bool)
    endpoint_public_access  = optional(bool)
    public_access_cidrs     = optional(list(string))
    security_group_ids      = optional(list(string))
  })
}

variable "access_config" {
  type    = any
  default = null
}

variable "compute_config" {
  type    = any
  default = null
}

variable "control_plane_scaling_config" {
  type    = any
  default = null
}

variable "encryption_config" {
  type    = any
  default = null
}

variable "kubernetes_network_config" {
  type    = any
  default = null
}

variable "remote_network_config" {
  type    = any
  default = null
}

variable "storage_config" {
  type    = any
  default = null
}

variable "upgrade_policy" {
  type    = any
  default = null
}

variable "zonal_shift_config" {
  type    = any
  default = null
}

variable "enabled_cluster_log_types" {
  type    = list(string)
  default = null
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "bootstrap_self_managed_addons" {
  type    = bool
  default = true
}

variable "force_update_version" {
  type    = bool
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
