resource "intersight_power_policy" "ue_grid_power" {
  name        = "ue-chassis-grid-mode"
  description = "Grid power"

  redundancy_mode  = "Grid"
  allocated_budget = 0

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

resource "intersight_power_policy" "ue_non_redundant" {
  name        = "ue-chassis-non-redundant-mode"
  description = "Non-redundant power"

  redundancy_mode  = "NotRedundant"
  allocated_budget = 0

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