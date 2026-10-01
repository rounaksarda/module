resource "aws_ec2_transit_gateway_route_table" "tgw_route_table" {

  transit_gateway_id = var.transit_gateway_id

  tags = merge(
    {
      ManagedBy = "Terraform"
    },
    var.tags
  )
}
