variable "region" {
  type    = string
  default = null
}

# Required
variable "function_name" {
  type = string
}

variable "role" {
  type = string
}

# Package settings
variable "package_type" {
  type    = string
  default = "Zip"
}

variable "filename" {
  type    = string
  default = null
}

variable "image_uri" {
  type    = string
  default = null
}

variable "s3_bucket" {
  type    = string
  default = null
}

variable "s3_key" {
  type    = string
  default = null
}

variable "s3_object_version" {
  type    = string
  default = null
}

variable "runtime" {
  type    = string
  default = null
}

variable "handler" {
  type    = string
  default = null
}

variable "architectures" {
  type    = list(string)
  default = ["x86_64"]
}

variable "memory_size" {
  type    = number
  default = 128
}

variable "timeout" {
  type    = number
  default = 3
}

variable "publish" {
  type    = bool
  default = false
}

variable "publish_to" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "layers" {
  type    = list(string)
  default = null
}

variable "reserved_concurrent_executions" {
  type    = number
  default = -1
}

variable "kms_key_arn" {
  type    = string
  default = null
}

variable "source_kms_key_arn" {
  type    = string
  default = null
}

variable "source_code_hash" {
  type    = string
  default = null
}

variable "code_sha256" {
  type    = string
  default = null
}

variable "code_signing_config_arn" {
  type    = string
  default = null
}

variable "skip_destroy" {
  type    = bool
  default = false
}

variable "replace_security_groups_on_destroy" {
  type    = bool
  default = false
}

variable "replacement_security_group_ids" {
  type    = list(string)
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "environment" {
  type = object({
    variables = optional(map(string))
  })
  default = null
}

variable "dead_letter_config" {
  type = object({
    target_arn = string
  })
  default = null
}

variable "ephemeral_storage" {
  type = object({
    size = number
  })
  default = null
}

variable "file_system_config" {
  type = object({
    arn              = string
    local_mount_path = string
  })
  default = null
}

variable "image_config" {
  type = object({
    command           = optional(list(string))
    entry_point       = optional(list(string))
    working_directory = optional(string)
  })
  default = null
}

variable "logging_config" {
  type = object({
    log_format            = string
    application_log_level = optional(string)
    system_log_level      = optional(string)
    log_group             = optional(string)
  })
  default = null
}

variable "snap_start" {
  type = object({
    apply_on = string
  })
  default = null
}

variable "tracing_config" {
  type = object({
    mode = string
  })
  default = null
}

variable "tenancy_config" {
  type = object({
    tenant_isolation_mode = string
  })
  default = null
}

variable "vpc_config" {
  type = object({
    subnet_ids                  = list(string)
    security_group_ids          = list(string)
    ipv6_allowed_for_dual_stack = optional(bool)
  })
  default = null
}

variable "capacity_provider_config" {
  type = object({
    lambda_managed_instances_capacity_provider_config = object({
      capacity_provider_arn                     = string
      execution_environment_memory_gib_per_vcpu = optional(number)
      per_execution_environment_max_concurrency = optional(number)
    })
  })
  default = null
}