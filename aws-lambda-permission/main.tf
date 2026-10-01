resource "aws_lambda_permission" "lambda_permission" {

  action        = var.action
  function_name = var.function_name
  principal     = var.principal

  statement_id        = try(var.statement_id, null)
  statement_id_prefix = try(var.statement_id_prefix, null)

  source_arn     = try(var.source_arn, null)
  source_account = try(var.source_account, null)

  principal_org_id = try(var.principal_org_id, null)

  qualifier = try(var.qualifier, null)

  event_source_token = try(var.event_source_token, null)

  function_url_auth_type = try(var.function_url_auth_type, null)

  invoked_via_function_url = try(var.invoked_via_function_url, null)
}