output "role_id" {
  description = "IAM role ID."
  value       = aws_iam_role.iam.id
}

output "role_name" {
  description = "IAM role name."
  value       = aws_iam_role.iam.name
}

output "role_arn" {
  description = "IAM role ARN."
  value       = aws_iam_role.iam.arn
}

output "role_unique_id" {
  description = "Stable and unique string identifying the role."
  value       = aws_iam_role.iam.unique_id
}
