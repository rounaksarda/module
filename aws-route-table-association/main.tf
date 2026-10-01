resource "aws_route_table_association" "rta" {
  route_table_id = var.route_table_id
  subnet_id      = var.subnet_id
  gateway_id     = var.gateway_id
}

# resource "aws_route_table_association" "rta" {
#   for_each = toset(var.subnet_ids)

#   subnet_id      = each.value
#   route_table_id = var.route_table_id
# }
