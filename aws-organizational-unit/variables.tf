variable "name" {
  description = "The name of the Organizational Unit"
  type        = string
}

variable "parent_id" {
  description = "ID of the parent Organizational Unit or Root (r-xxxx)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the Organizational Unit"
  type        = map(string)
  default     = {}
}
