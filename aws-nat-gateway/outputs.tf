output "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

# output "nat_gateway_arn" {
#   description = "ARN of the NAT Gateway"
#   value       = aws_nat_gateway.nat.arn
# }

output "nat_gateway_network_interface_id" {
  description = "Network interface ID created by NAT Gateway"
  value       = aws_nat_gateway.nat.network_interface_id
}

output "nat_gateway_private_ip" {
  description = "Primary private IP of NAT Gateway"
  value       = aws_nat_gateway.nat.private_ip
}

output "nat_gateway_public_ip" {
  description = "Primary public IP of NAT Gateway (if public)"
  value       = aws_nat_gateway.nat.public_ip
}
