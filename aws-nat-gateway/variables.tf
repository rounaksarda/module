variable "region" {
  description = "Region where the NAT Gateway will be managed"
  type        = string
  default     = null
}

variable "availability_mode" {
  description = "NAT Gateway mode: zonal or regional"
  type        = string
  default     = "zonal"

  validation {
    condition     = contains(["zonal", "regional"], var.availability_mode)
    error_message = "availability_mode must be either 'zonal' or 'regional'."
  }
}

variable "connectivity_type" {
  description = "Connectivity type for NAT Gateway: public or private"
  type        = string
  default     = "public"

  validation {
    condition     = contains(["public", "private"], var.connectivity_type)
    error_message = "connectivity_type must be 'public' or 'private'."
  }
}

# -------- ZONAL NAT GATEWAY --------

variable "allocation_id" {
  description = "Elastic IP allocation ID (required for zonal public NAT)"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID for zonal NAT Gateway"
  type        = string
  default     = null
}

variable "private_ip" {
  description = "Primary private IPv4 address for zonal NAT Gateway"
  type        = string
  default     = null
}

variable "secondary_allocation_ids" {
  description = "Secondary Elastic IP allocation IDs (zonal NAT only)"
  type        = list(string)
  default     = []
}

variable "secondary_private_ip_address_count" {
  description = "Number of secondary private IPv4 addresses"
  type        = number
  default     = null
}

variable "secondary_private_ip_addresses" {
  description = "List of secondary private IPv4 addresses"
  type        = list(string)
  default     = []
}

# -------- REGIONAL NAT GATEWAY --------

variable "vpc_id" {
  description = "VPC ID (required for regional NAT Gateway)"
  type        = string
  default     = null
}

variable "availability_zone_address" {
  description = <<EOT
List of availability zone configurations for regional NAT Gateway (manual mode).
If omitted, NAT Gateway operates in auto-expansion mode.
EOT

  type = list(object({
    allocation_ids       = list(string)
    availability_zone    = optional(string)
    availability_zone_id = optional(string)
  }))

  default = []
}

variable "tags" {
  description = "Tags to assign to NAT Gateway"
  type        = map(string)
  default     = {}
}
