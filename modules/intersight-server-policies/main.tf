resource "intersight_kvm_policy" "kvm1" {
  name                      = "ue-tunneled-kvm-enabled"
  description               = "Enable Tunneled vKVM"
  enabled                   = true
  maximum_sessions          = 3
  remote_port               = 2069
  enable_video_encryption   = true
  enable_local_server_video = true

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

resource "intersight_storage_storage_policy" "m2_raid" {
  name                     = "ue-m2-raid"
  description              = "M2 RAID for Unified Edge"

  m2_virtual_drive {
    controller_slot = "MSTOR-RAID-1"
    enable          = true
    name            = "M2-RAID"
    object_type     = "storage.M2VirtualDriveConfig"
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
