variable "vpc_id" {
  description = "The VPC ID to attach the Internet Gateway to."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to assign to the Internet Gateway."
  type        = map(string)
  default     = {}
}
