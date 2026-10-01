resource "aws_sns_topic_subscription" "aws_sns_topic_subscription" {
  topic_arn = var.topic_arn
  protocol  = var.protocol
  endpoint  = var.endpoint

  subscription_role_arn = try(var.subscription_role_arn, null)

  confirmation_timeout_in_minutes = try(var.confirmation_timeout_in_minutes, null)
  delivery_policy                  = try(var.delivery_policy, null)
  endpoint_auto_confirms           = try(var.endpoint_auto_confirms, false)
  filter_policy                    = try(var.filter_policy, null)
  filter_policy_scope              = try(var.filter_policy_scope, null)
  raw_message_delivery             = try(var.raw_message_delivery, false)
  redrive_policy                   = try(var.redrive_policy, null)
  replay_policy                    = try(var.replay_policy, null)
}