resource "aws_elastic_beanstalk_application" "this" {

  name        = var.name
  description = var.description
  tags        = var.tags

  dynamic "appversion_lifecycle" {
    for_each = var.appversion_lifecycle != null ? [var.appversion_lifecycle] : []

    content {
      service_role = appversion_lifecycle.value.service_role

      max_count       = try(appversion_lifecycle.value.max_count, null)
      max_age_in_days = try(appversion_lifecycle.value.max_age_in_days, null)

      delete_source_from_s3 = try(
        appversion_lifecycle.value.delete_source_from_s3,
        false
      )
    }
  }
}
