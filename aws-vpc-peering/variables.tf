variable "region" {
  description = "Region where this resource is managed (handled by provider)"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The ID of the requester VPC"
  type        = string
}

variable "peer_vpc_id" {
  description = "The ID of the peer VPC"
  type        = string
}

variable "peer_owner_id" {
  description = "AWS Account ID of the peer VPC owner (required for cross-account)"
  type        = string
  default     = null
}

variable "peer_region" {
  description = "Region of the peer VPC (required for cross-region peering)"
  type        = string
  default     = null
}

variable "auto_accept" {
  description = "Automatically accept the peering connection (same account & region only)"
  type        = bool
  default     = false
}

variable "requester" {
  description = "Requester-side VPC peering options"
  type = object({
    allow_remote_vpc_dns_resolution = optional(bool)
  })
  default = null
}

variable "accepter" {
  description = "Accepter-side VPC peering options"
  type = object({
    allow_remote_vpc_dns_resolution = optional(bool)
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to the VPC peering connection"
  type        = map(string)
  default     = {}
}
