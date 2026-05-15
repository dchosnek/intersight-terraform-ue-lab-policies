resource "intersight_boot_precision_policy" "ue_boot_order" {
  // Intersight normalizes boot-policy tags by adding system metadata, so
  // ignore tag drift here to avoid no-op changes on every apply.
  lifecycle {
    ignore_changes = [tags]
  }

  name                     = "ue-boot-order"
  description              = "Unified Edge boot order without secure boot"
  configured_boot_mode     = "Uefi"
  enforce_uefi_secure_boot = false

  boot_devices {
    enabled     = true
    name        = "imc-mapped-dvd"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "cimc-mapped-dvd"
    })
  }

  boot_devices {
    enabled     = true
    name        = "kvm-mapped-dvd"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "kvm-mapped-dvd"
    })
  }

  boot_devices {
    enabled     = true
    name        = "m2-disk"
    object_type = "boot.LocalDisk"
    additional_properties = jsonencode({
      Slot = "MSTOR-RAID"
      Bootloader = {
        Description = ""
        Name        = ""
        ObjectType  = "boot.Bootloader"
        Path        = ""
      }
    })
  }

  boot_devices {
    enabled     = true
    name        = "e3s-disk"
    object_type = "boot.Nvme"
    additional_properties = jsonencode({
      Bootloader = {
        Description = ""
        Name        = ""
        ObjectType  = "boot.Bootloader"
        Path        = ""
      }
    })
  }

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

resource "intersight_boot_precision_policy" "ue_boot_secure" {
  name                     = "ue-boot-order-secure"
  description              = "Unified Edge boot order with secure boot"
  configured_boot_mode     = "Uefi"
  enforce_uefi_secure_boot = true

  boot_devices {
    enabled     = true
    name        = "imc-mapped-dvd"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "cimc-mapped-dvd"
    })
  }

  boot_devices {
    enabled     = true
    name        = "kvm-mapped-dvd"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "kvm-mapped-dvd"
    })
  }

  boot_devices {
    enabled     = true
    name        = "m2-disk"
    object_type = "boot.LocalDisk"
    additional_properties = jsonencode({
      Slot = "MSTOR-RAID"
      Bootloader = {
        Description = ""
        Name        = ""
        ObjectType  = "boot.Bootloader"
        Path        = ""
      }
    })
  }

  boot_devices {
    enabled     = true
    name        = "e3s-disk"
    object_type = "boot.Nvme"
    additional_properties = jsonencode({
      Bootloader = {
        Description = ""
        Name        = ""
        ObjectType  = "boot.Bootloader"
        Path        = ""
      }
    })
  }

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
