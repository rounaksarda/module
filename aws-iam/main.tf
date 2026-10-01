resource "aws_iam_role" "iam" {
  name                 = var.name
  name_prefix          = var.name_prefix
  description          = var.description
  assume_role_policy   = var.assume_role_policy
  path                 = var.path
  max_session_duration = var.max_session_duration
  permissions_boundary = var.permissions_boundary
  force_detach_policies = var.force_detach_policies
  tags                 = var.tags
}


