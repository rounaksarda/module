variable "role" {
  description = "IAM role name to attach the policy to."
  type        = string
}

variable "policy_arn" {
  description = "ARN of the IAM managed policy to attach."
  type        = string
}
