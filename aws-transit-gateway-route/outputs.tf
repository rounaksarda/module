output "tgw_route_id" {
  description = "Transit Gateway Route ID"
  value       = aws_ec2_transit_gateway_route.tgw_route.id
}
