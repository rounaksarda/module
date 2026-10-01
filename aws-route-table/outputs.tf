output "route_table_id" {
  description = "Route table ID"
  value       = aws_route_table.route_table.id
}

output "route_table_arn" {
  description = "Route table ARN"
  value       = aws_route_table.route_table.arn
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_route_table.route_table.vpc_id
}

output "routes" {
  description = "Routes configured in the route table"
  value       = aws_route_table.route_table.route
}
