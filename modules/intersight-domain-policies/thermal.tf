resource "intersight_thermal_policy" "ue_acoustic_fan" {
  name        = "ue-fans-acoustic"
  description = "Unified Edge acoustic thermal profile"

  fan_control_mode = "Acoustic"

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

resource "intersight_thermal_policy" "ue_balanced_fan" {
  name        = "ue-fans-balanced"
  description = "Unified Edge balanced thermal profile"

  fan_control_mode = "Balanced"

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