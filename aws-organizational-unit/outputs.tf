output "ou_id" {
  description = "The ID of the Organizational Unit"
  value       = aws_organizations_organizational_unit.unit.id
}

output "ou_arn" {
  description = "The ARN of the Organizational Unit"
  value       = aws_organizations_organizational_unit.unit.arn
}

output "ou_name" {
  description = "The name of the Organizational Unit"
  value       = aws_organizations_organizational_unit.unit.name
}

output "parent_id" {
  description = "The parent ID of the Organizational Unit"
  value       = aws_organizations_organizational_unit.unit.parent_id
}
