output "association_id" {
  description = "Transit Gateway Route Table Association ID"
  value       = aws_ec2_transit_gateway_route_table_association.tgw_rt_association.id
}
