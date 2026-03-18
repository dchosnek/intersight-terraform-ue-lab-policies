resource "intersight_compute_scrub_policy" "bios_scrub" {
  name          = "ue-bios-scrub"
  description   = "Scrubs BIOS settings but not disks"
  scrub_targets = ["BIOS"]

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
