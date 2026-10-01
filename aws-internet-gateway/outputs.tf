output "id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.aig.id
}

output "arn" {
  description = "The ARN of the Internet Gateway."
  value       = aws_internet_gateway.aig.arn
}

output "owner_id" {
  description = "The AWS account ID of the Internet Gateway owner."
  value       = aws_internet_gateway.aig.owner_id
}
