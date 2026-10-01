variable "name" {
  description = "Friendly name for the AWS member account"
  type        = string

  validation {
    condition     = length(var.name) >= 3
    error_message = "Account name must be at least 3 characters."
  }
}

variable "email" {
  description = "Email address for the AWS account (must be unique)"
  type        = string

  validation {
    condition     = can(regex("^[^@]+@[^@]+\\.[^@]+$", var.email))
    error_message = "A valid email address is required."
  }
}

variable "parent_id" {
  description = "Parent OU ID or Root ID where the account will be created"
  type        = string
  default     = null
}

variable "role_name" {
  description = "IAM role name created in the new account with admin permissions"
  type        = string
  default     = "OrganizationAccountAccessRole"
}

variable "iam_user_access_to_billing" {
  description = "Whether IAM users can access billing information (ALLOW or DENY)"
  type        = string
  default     = "ALLOW"

  validation {
    condition     = contains(["ALLOW", "DENY"], var.iam_user_access_to_billing)
    error_message = "iam_user_access_to_billing must be ALLOW or DENY."
  }
}

variable "close_on_deletion" {
  description = "Whether to close the AWS account when Terraform destroys the resource"
  type        = bool
  default     = false
}

variable "create_govcloud" {
  description = "Whether to create an associated GovCloud account"
  type        = bool
  default     = false
}
 
variable "tags" {
  description = "Tags to apply to the AWS account"
  type        = map(string)
  default     = {}
}
