resource "intersight_sol_policy" "ue_enable_sol" {
  name        = "ue-enable-sol"
  description = "enable serial over LAN"
  enabled     = true
  baud_rate   = 115200
  com_port    = "com0"
  ssh_port    = 2400

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
