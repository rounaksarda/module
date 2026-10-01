variable "name" {
  description = "DNS name of the hosted zone (e.g. example.com)"
  type        = string
}

variable "comment" {
  description = "Comment for the hosted zone"
  type        = string
  default     = "Managed by Terraform"
}

variable "force_destroy" {
  description = "Destroy all records in the hosted zone when deleting"
  type        = bool
  default     = false
}

variable "enable_accelerated_recovery" {
  description = "Enable Route53 accelerated DNS recovery"
  type        = bool
  default     = false
}

variable "delegation_set_id" {
  description = "Reusable delegation set ID (public zones only)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the hosted zone"
  type        = map(string)
  default     = {}
}

variable "vpcs" {
  description = <<EOT
List of VPCs to associate with the hosted zone.
If provided, the zone becomes a private hosted zone.
Conflicts with delegation_set_id.
EOT

  type = list(object({
    vpc_id     = string
    vpc_region = optional(string)
  }))

  default = []
}

variable "prevent_destroy" {
  description = "Prevent accidental deletion of the hosted zone"
  type        = bool
  default     = false
}
