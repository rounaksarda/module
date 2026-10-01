variable "region" {
  description = "Region where this resource will be managed"
  type        = string
  default     = null
}

variable "dashboard_name" {
  description = "The name of the CloudWatch dashboard"
  type        = string
}

variable "dashboard_body" {
  description = <<EOT
The detailed information about the dashboard.
Can be provided as:
- A JSON string
- A Terraform object/map (will be jsonencoded)
EOT
  type = any
}