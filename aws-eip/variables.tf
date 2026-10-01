variable "domain" {
  description = "Indicates if this EIP is for use in VPC (vpc)."
  type        = string
  default     = "vpc"
}

variable "address" {
  description = "IP address from an EC2 BYOIP pool."
  type        = string
  default     = null
}

variable "public_ipv4_pool" {
  description = "EC2 IPv4 address pool identifier or amazon."
  type        = string
  default     = null
}

variable "customer_owned_ipv4_pool" {
  description = "ID of a customer-owned address pool."
  type        = string
  default     = null
}

variable "ipam_pool_id" {
  description = "ID of an IPAM pool."
  type        = string
  default     = null
}

variable "network_border_group" {
  description = "Location from which the IP address is advertised."
  type        = string
  default     = null
}

variable "instance" {
  description = "EC2 instance ID to associate with the EIP."
  type        = string
  default     = null
}

variable "network_interface" {
  description = "Network interface ID to associate with the EIP."
  type        = string
  default     = null
}

variable "associate_with_private_ip" {
  description = "Private IP to associate with the EIP."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to assign to the Elastic IP."
  type        = map(string)
  default     = {}
}
