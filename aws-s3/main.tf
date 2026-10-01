resource "aws_s3_bucket" "aws_s3" {

  region              = var.region
  bucket              = var.bucket
  bucket_prefix       = var.bucket_prefix
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags

  
  # Deprecated Arguments
#   acceleration_status = var.acceleration_status
#   acl                 = var.acl
#   grant               = var.grant
#   request_payer       = var.request_payer
#   policy              = var.policy

 
  # CORS Rule
  dynamic "cors_rule" {
    for_each = var.cors_rule == null ? [] : [var.cors_rule]
    content {
      allowed_headers = lookup(cors_rule.value, "allowed_headers", null)
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = lookup(cors_rule.value, "expose_headers", null)
      max_age_seconds = lookup(cors_rule.value, "max_age_seconds", null)
    }
  }

 
  # Lifecycle Rules
  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule == null ? [] : [var.lifecycle_rule]
    content {
      id      = lookup(lifecycle_rule.value, "id", null)
      prefix  = lookup(lifecycle_rule.value, "prefix", null)
      enabled = lifecycle_rule.value.enabled
      tags    = lookup(lifecycle_rule.value, "tags", null)

      abort_incomplete_multipart_upload_days = lookup(lifecycle_rule.value, "abort_incomplete_multipart_upload_days", null)
    }
  }

 
  # Logging
  dynamic "logging" {
    for_each = var.logging == null ? [] : [var.logging]
    content {
      target_bucket = logging.value.target_bucket
      target_prefix = lookup(logging.value, "target_prefix", null)
    }
  }

  
  # Versioning
  dynamic "versioning" {
    for_each = var.versioning == null ? [] : [var.versioning]
    content {
      enabled    = lookup(versioning.value, "enabled", false)
      mfa_delete = lookup(versioning.value, "mfa_delete", false)
    }
  }

 
  # Server Side Encryption
  dynamic "server_side_encryption_configuration" {
    for_each = var.server_side_encryption_configuration == null ? [] : [var.server_side_encryption_configuration]
    content {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm     = server_side_encryption_configuration.value.sse_algorithm
          kms_master_key_id = lookup(server_side_encryption_configuration.value, "kms_master_key_id", null)
        }
        bucket_key_enabled = lookup(server_side_encryption_configuration.value, "bucket_key_enabled", null)
      }
    }
  }


  # Website Configuration
  dynamic "website" {
    for_each = var.website == null ? [] : [var.website]
    content {
      index_document           = lookup(website.value, "index_document", null)
      error_document           = lookup(website.value, "error_document", null)
      redirect_all_requests_to = lookup(website.value, "redirect_all_requests_to", null)
      routing_rules            = lookup(website.value, "routing_rules", null)
    }
  }


  # Replication Configuration
  dynamic "replication_configuration" {
    for_each = var.replication_configuration == null ? [] : [var.replication_configuration]
    content {
      role = replication_configuration.value.role

      dynamic "rules" {
        for_each = replication_configuration.value.rules
        content {
          id     = lookup(rules.value, "id", null)
          status = rules.value.status
          prefix = lookup(rules.value, "prefix", null)
          priority = lookup(rules.value, "priority", null)

          destination {
            bucket        = rules.value.destination.bucket
            storage_class = lookup(rules.value.destination, "storage_class", null)
          }
        }
      }
    }
  }
}
