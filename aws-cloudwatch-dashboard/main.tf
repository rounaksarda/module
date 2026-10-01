resource "aws_cloudwatch_dashboard" "aws_cloudwatch_dashboard" {
  dashboard_name = var.dashboard_name

  dashboard_body = try(
    can(jsondecode(var.dashboard_body))
    ? var.dashboard_body
    : jsonencode(var.dashboard_body),
    jsonencode(var.dashboard_body)
  )
}