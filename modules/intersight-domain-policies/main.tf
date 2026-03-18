
resource "intersight_syslog_policy" "syslog_warning" {
  name        = "ue-syslog-warning"
  description = "Log events that are warning or above"

  local_clients {
    min_severity = "warning"
    object_type  = "syslog.LocalFileLoggingClient"
  }

  organization {
    object_type = "organization.Organization"
    moid        = var.org_moid
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

}
