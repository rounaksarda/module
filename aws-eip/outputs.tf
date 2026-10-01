output "id" {
  value       = aws_eip.eip.id
  description = "Allocation ID of the Elastic IP."
}

output "public_ip" {
  value       = aws_eip.eip.public_ip
  description = "Public IPv4 address."
}

output "public_dns" {
  value       = aws_eip.eip.public_dns
  description = "Public DNS name."
}
