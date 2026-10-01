output "subnet_id" {
  description = "Subnet ID"
  value       = aws_subnet.subnet.id
}

output "subnet_arn" {
  description = "Subnet ARN"
  value       = aws_subnet.subnet.arn
}

output "availability_zone" {
  description = "Availability Zone of subnet"
  value       = aws_subnet.subnet.availability_zone
}

output "cidr_block" {
  description = "IPv4 CIDR block"
  value       = aws_subnet.subnet.cidr_block
}

output "ipv6_cidr_block" {
  description = "IPv6 CIDR block"
  value       = aws_subnet.subnet.ipv6_cidr_block
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_subnet.subnet.vpc_id
}
