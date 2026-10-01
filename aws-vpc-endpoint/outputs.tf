output "vpc_endpoint_id" {
  description = "VPC Endpoint ID"
  value       = aws_vpc_endpoint.endpoint.id
}

output "vpc_endpoint_arn" {
  description = "VPC Endpoint ARN"
  value       = aws_vpc_endpoint.endpoint.arn
}

output "state" {
  description = "Current state of the VPC Endpoint"
  value       = aws_vpc_endpoint.endpoint.state
}

output "dns_entries" {
  description = "DNS entries for Interface endpoints"
  value       = aws_vpc_endpoint.endpoint.dns_entry
}

output "network_interface_ids" {
  description = "Network interfaces created for the endpoint"
  value       = aws_vpc_endpoint.endpoint.network_interface_ids
}
