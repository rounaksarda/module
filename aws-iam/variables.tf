
# Required
variable "assume_role_policy" {
  description = "Policy that grants an entity permission to assume the role (JSON string). Use aws_iam_policy_document data source."
  type        = string
}

variable "name" {
  description = "Friendly name of the role. Conflicts with name_prefix."
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique friendly name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "description" {
  description = "Description of the IAM role."
  type        = string
  default     = null
}

variable "path" {
  description = "Path to the role."
  type        = string
  default     = "/"
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds (3600–43200)."
  type        = number
  default     = 3600
}

variable "permissions_boundary" {
  description = "ARN of the policy used to set the permissions boundary for the role."
  type        = string
  default     = null
}

variable "force_detach_policies" {
  description = "Whether to force detaching any policies before destroying the role."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the IAM role."
  type        = map(string)
  default     = {}
}


# Managed policy attachments (Deprecated but supported)
# variable "managed_policy_arns" {
#   description = "Set of IAM managed policy ARNs to attach to the role."
#   type        = set(string)
#   default     = null
# }


# Inline policies (Deprecated but supported)
# variable "inline_policies" {
#   description = <<EOT
# Map of inline IAM policies to attach to the role.
# Key   = policy name
# Value = JSON policy document string
# EOT
#   type        = map(string)
#   default     = {}
# }
