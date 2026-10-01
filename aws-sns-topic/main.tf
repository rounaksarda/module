resource "aws_sns_topic" "aws_sns_topic" {
  name        = try(var.name, null)
  name_prefix = try(var.name_prefix, null)

  display_name  = try(var.display_name, null)
  policy        = try(var.policy, null)
  delivery_policy = try(var.delivery_policy, null)

  kms_master_key_id = try(var.kms_master_key_id, null)
  signature_version = try(var.signature_version, null)
  tracing_config    = try(var.tracing_config, null)

  fifo_topic                  = try(var.fifo_topic, false)
  fifo_throughput_scope       = try(var.fifo_throughput_scope, null)
  content_based_deduplication = try(var.content_based_deduplication, null)
  archive_policy              = try(var.archive_policy, null)

  application_success_feedback_role_arn       = try(var.application_success_feedback_role_arn, null)
  application_success_feedback_sample_rate    = try(var.application_success_feedback_sample_rate, null)
  application_failure_feedback_role_arn       = try(var.application_failure_feedback_role_arn, null)

  http_success_feedback_role_arn               = try(var.http_success_feedback_role_arn, null)
  http_success_feedback_sample_rate            = try(var.http_success_feedback_sample_rate, null)
  http_failure_feedback_role_arn               = try(var.http_failure_feedback_role_arn, null)

  lambda_success_feedback_role_arn             = try(var.lambda_success_feedback_role_arn, null)
  lambda_success_feedback_sample_rate          = try(var.lambda_success_feedback_sample_rate, null)
  lambda_failure_feedback_role_arn             = try(var.lambda_failure_feedback_role_arn, null)

  sqs_success_feedback_role_arn                = try(var.sqs_success_feedback_role_arn, null)
  sqs_success_feedback_sample_rate             = try(var.sqs_success_feedback_sample_rate, null)
  sqs_failure_feedback_role_arn                = try(var.sqs_failure_feedback_role_arn, null)

  firehose_success_feedback_role_arn           = try(var.firehose_success_feedback_role_arn, null)
  firehose_success_feedback_sample_rate        = try(var.firehose_success_feedback_sample_rate, null)
  firehose_failure_feedback_role_arn           = try(var.firehose_failure_feedback_role_arn, null)

  tags = try(var.tags, {})
}