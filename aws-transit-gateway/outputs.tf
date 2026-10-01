output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.tgw.id
}

output "transit_gateway_arn" {
  value = aws_ec2_transit_gateway.tgw.arn
}

output "association_default_route_table_id" {
  value = aws_ec2_transit_gateway.tgw.association_default_route_table_id
}

output "propagation_default_route_table_id" {
  value = aws_ec2_transit_gateway.tgw.propagation_default_route_table_id
}
