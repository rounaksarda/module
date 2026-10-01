output "attachment_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
}

output "vpc_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.vpc_id
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.transit_gateway_id
}
