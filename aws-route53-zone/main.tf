resource "aws_route53_zone" "aws_route53_zone" {
  name    = var.name
  comment = var.comment

  delegation_set_id = var.delegation_set_id
  force_destroy     = var.force_destroy

  enable_accelerated_recovery = var.enable_accelerated_recovery

  tags = var.tags

  dynamic "vpc" {
    for_each = var.vpcs
    content {
      vpc_id     = vpc.value.vpc_id
      vpc_region = lookup(vpc.value, "vpc_region", null)
    }
  }

  # lifecycle {
  #   prevent_destroy = var.prevent_destroy
  # }
}
