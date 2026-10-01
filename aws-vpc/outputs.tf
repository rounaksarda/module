output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.vpc.id
}

output "vpc_arn" {
  description = "VPC ARN"
  value       = aws_vpc.vpc.arn
}

output "vpc_cidr_block" {
  description = "IPv4 CIDR block of the VPC"
  value       = aws_vpc.vpc.cidr_block
}

output "ipv6_cidr_block" {
  description = "IPv6 CIDR block of the VPC"
  value       = aws_vpc.vpc.ipv6_cidr_block
}

output "main_route_table_id" {
  description = "Main route table ID"
  value       = aws_vpc.vpc.main_route_table_id
}

output "default_network_acl_id" {
  description = "Default Network ACL ID"
  value       = aws_vpc.vpc.default_network_acl_id
}

output "default_security_group_id" {
  description = "Default Security Group ID"
  value       = aws_vpc.vpc.default_security_group_id
}
