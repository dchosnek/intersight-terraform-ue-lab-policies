resource "intersight_bios_policy" "ue_bios_serial_redirect" {
  name        = "ue-bios-serial-redirect"
  description = "enable serial redirection"

  baud_rate              = "115200"
  console_redirection    = "com-0"
  legacy_os_redirection  = "enabled"
  redirection_after_post = "Always Enable"
  serial_mux             = "enabled"
  serial_port_aenable    = "enabled"
  terminal_type          = "vt100"

  organization {
    moid        = var.org_moid
    object_type = "organization.Organization"
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
}
