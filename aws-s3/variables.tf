# Core Bucket Settings
variable "region" {
  description = "Region where the S3 bucket will be created. Defaults to provider region."
  type        = string
  default     = null
}

variable "bucket" {
  description = "Name of the S3 bucket. Must be globally unique."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "Allow deletion of all objects when destroying the bucket."
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = "Enable S3 Object Lock. Only valid for new buckets."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}


# # Deprecated Arguments (Inline)

# variable "acceleration_status" {
#   description = "Deprecated: Use aws_s3_bucket_accelerate_configuration instead."
#   type        = string
#   default     = null
# }

# variable "acl" {
#   description = "Deprecated: Use aws_s3_bucket_acl instead."
#   type        = string
#   default     = null
# }

# variable "grant" {
#   description = "Deprecated: Use aws_s3_bucket_acl instead."
#   type        = any
#   default     = null
# }

# variable "policy" {
#   description = "Deprecated: Use aws_s3_bucket_policy instead."
#   type        = string
#   default     = null
# }

# variable "request_payer" {
#   description = "Deprecated: Use aws_s3_bucket_request_payment_configuration instead."
#   type        = string
#   default     = null
# }


# CORS Configuration
variable "cors_rule" {
  description = "List of CORS rules."
  type        = list(any)
  default     = []
}


# Lifecycle Rules
variable "lifecycle_rule" {
  description = "List of lifecycle rules."
  type        = list(any)
  default     = []
}


# Logging Configuration
variable "logging" {
  description = "Logging configuration block."
  type        = any
  default     = null
}


# Versioning Configuration
variable "versioning" {
  description = "Versioning configuration block."
  type        = any
  default     = null
}


# Website Configuration
variable "website" {
  description = "Website configuration block."
  type        = any
  default     = null
}


# Server-Side Encryption Configuration
variable "server_side_encryption_configuration" {
  description = "Server-side encryption configuration."
  type        = any
  default     = null
}


# Replication Configuration
variable "replication_configuration" {
  description = "Replication configuration block."
  type        = any
  default     = null
}
