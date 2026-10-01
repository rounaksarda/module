output "network_acl_id" {
  description = "Network ACL ID"
  value       = aws_network_acl.nacl.id
}

output "network_acl_arn" {
  description = "Network ACL ARN"
  value       = aws_network_acl.nacl.arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_network_acl.nacl.vpc_id
}

output "subnet_ids" {
  description = "Associated subnet IDs"
  value       = aws_network_acl.nacl.subnet_ids
}
