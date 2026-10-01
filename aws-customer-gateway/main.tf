resource "aws_customer_gateway" "aws_customer_gateway" {

  type = var.type

  ip_address = var.ip_address

  bgp_asn          = var.bgp_asn
  bgp_asn_extended = var.bgp_asn_extended

  certificate_arn = var.certificate_arn
  device_name     = var.device_name

  tags = var.tags
}