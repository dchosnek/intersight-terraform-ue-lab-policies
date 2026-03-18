resource "intersight_power_policy" "restore_last_state" {
  name                = "ue-server-restore-last"
  description         = "Server returns to last power state after a power outage"
  power_restore_state = "LastState"

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

resource "intersight_power_policy" "restore_always_off" {
  name                = "ue-server-restore-off"
  description         = "Server remains off after a power outage"
  power_restore_state = "AlwaysOff"

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
