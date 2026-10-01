variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the instance"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
  default     = null
}

variable "private_ip" {
  description = "Private IP address to assign to the instance"
  type        = string
  default     = null
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default     = null
}

variable "tenancy" {
  description = "Tenancy of the instance (default or dedicated)"
  type        = string
  default     = "default"
}

variable "monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  description = "Enable EBS optimization"
  type        = bool
  default     = false
}

variable "hibernation" {
  description = "Enable instance hibernation"
  type        = bool
  default     = false
}

variable "source_dest_check" {
  description = "Enable source/destination check"
  type        = bool
  default     = true
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
  default     = null
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
  default     = null
}

variable "security_groups" {
  description = "List of security group names (EC2-Classic only)"
  type        = list(string)
  default     = null
}

variable "disable_api_termination" {
  description = "Enable termination protection"
  type        = bool
  default     = false
}

variable "disable_api_stop" {
  description = "Prevent instance stop via API"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "User data script"
  type        = string
  default     = null
}

variable "user_data_base64" {
  description = "Base64 encoded user data"
  type        = string
  default     = null
}

variable "user_data_replace_on_change" {
  description = "Replace instance when user_data changes"
  type        = bool
  default     = false
}

variable "ipv6_address_count" {
  description = "Number of IPv6 addresses to assign"
  type        = number
  default     = null
}

variable "ipv6_addresses" {
  description = "List of specific IPv6 addresses"
  type        = list(string)
  default     = null
}

variable "secondary_private_ips" {
  description = "List of secondary private IPs"
  type        = list(string)
  default     = null
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior (stop or terminate)"
  type        = string
  default     = "stop"
}

variable "placement_group" {
  description = "Placement group name"
  type        = string
  default     = null
}

variable "placement_group_id" {
  description = "Placement group ID"
  type        = string
  default     = null
}

variable "placement_partition_number" {
  description = "Placement partition number"
  type        = number
  default     = null
}

variable "host_id" {
  description = "Dedicated host ID"
  type        = string
  default     = null
}

variable "host_resource_group_arn" {
  description = "Host resource group ARN"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
  default     = {}
}

variable "volume_tags" {
  description = "Tags to apply to attached volumes"
  type        = map(string)
  default     = {}
}

variable "metadata_options" {
  description = "Instance metadata service configuration"
  type        = any
  default     = null
}

variable "cpu_options" {
  description = "CPU configuration options"
  type        = any
  default     = null
}

variable "credit_specification" {
  description = "CPU credit specification for burstable instances"
  type        = any
  default     = null
}

variable "instance_market_options" {
  description = "Market options (e.g., Spot instances)"
  type        = any
  default     = null
}

variable "root_block_device" {
  description = "Root volume configuration"
  type        = any
  default     = null
}

variable "ebs_block_device" {
  description = "Additional EBS block devices"
  type        = list(any)
  default     = []
}

variable "launch_template" {
  description = "Launch template configuration"
  type        = any
  default     = null
}
