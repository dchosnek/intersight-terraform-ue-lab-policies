resource "intersight_memory_policy" "dimm_blocklisting" {
  name                     = "ue-memory-dimm-blocklisting"
  description              = "DIMM blocklisting enabled"
  enable_dimm_blocklisting = true

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
