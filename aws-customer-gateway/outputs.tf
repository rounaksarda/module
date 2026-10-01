output "id" {
  description = "ID of the Customer Gateway."
  value       = aws_customer_gateway.aws_customer_gateway.id
}

output "arn" {
  description = "ARN of the Customer Gateway."
  value       = aws_customer_gateway.aws_customer_gateway.arn
}

output "bgp_asn" {
  description = "BGP ASN of the Customer Gateway."
  value       = aws_customer_gateway.aws_customer_gateway.bgp_asn
}

output "ip_address" {
  description = "IP address of the Customer Gateway."
  value       = aws_customer_gateway.aws_customer_gateway.ip_address
}
