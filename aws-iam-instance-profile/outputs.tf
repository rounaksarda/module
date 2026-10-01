output "id" {
  description = "IAM instance profile ID."
  value       = aws_iam_instance_profile.iam_instance_profile.id
}

output "arn" {
  description = "IAM instance profile ARN."
  value       = aws_iam_instance_profile.iam_instance_profile.arn
}

output "name" {
  description = "IAM instance profile name."
  value       = aws_iam_instance_profile.iam_instance_profile.name
}
