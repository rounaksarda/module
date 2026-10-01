output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.sg.id
}

output "security_group_arn" {
  description = "Security Group ARN"
  value       = aws_security_group.sg.arn
}

output "security_group_name" {
  description = "Security Group Name"
  value       = aws_security_group.sg.name
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_security_group.sg.vpc_id
}
