resource "aws_vpn_gateway" "vpn_gateway" {

  vpc_id             = var.vpc_id
  availability_zone  = var.availability_zone
  amazon_side_asn    = var.amazon_side_asn
  tags               = var.tags
}