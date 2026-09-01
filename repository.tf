locals {
  os = [
    {
      name    = "Ubuntu 24.04.4"
      vendor  = "Ubuntu"
      version = "Ubuntu Server 24.04.4 LTS"
      link    = "http://10.135.5.2/os/ubuntu-24.04.4-live-server-amd64.iso"
    },
    {
      name    = "Red Hat 9.6"
      vendor  = "Red Hat"
      version = "Red Hat Enterprise Linux 9.6"
      link    = "http://10.135.5.2/os/RHEL-9.6.0-20250408.20-x86_64-dvd1.iso"
    },
    {
      name    = "Windows 2025 July 2025 update"
      vendor  = "Microsoft"
      version = "Windows Server 2025"
      link    = "http://10.135.5.2/os/en-us_windows_server_2025_updated_july_2025_x64_dvd_a1f0681d.iso"
    },
    {
      name    = "Windows 2022 July 2022 update"
      vendor  = "Microsoft"
      version = "Windows Server 2022"
      link    = "http://10.135.5.2/os/en-us_windows_server_2022_updated_july_2025_x64_dvd_f3e39b78.iso"
    },
    {
      name    = "ESXi 9"
      vendor  = "VMware"
      version = "ESXi 9.0"
      link    = "http://10.135.5.2/os/ESXi-9.0.0-24649004-standard-Custom-20250522-1122.iso"
    },
  ]
}

data "intersight_softwarerepository_catalog" "common_user_catalog" {
  name = "user-catalog"

  organization {
    moid = data.intersight_organization_organization.common_org.results[0].moid
  }
}

resource "intersight_softwarerepository_operating_system_file" "os" {
  for_each = {
    for os in local.os : os.name => os
  }

  // Intersight adds system-managed tag metadata to imported OS entries, so
  // ignore tag drift here to keep repeated applies idempotent.
  lifecycle {
    ignore_changes = [tags]
  }

  name        = each.value.name
  description = local.description
  vendor      = each.value.vendor
  nr_version  = each.value.version
  file_name   = element(reverse(split("/", each.value.link)), 0)

  catalog {
    moid        = data.intersight_softwarerepository_catalog.common_user_catalog.results[0].moid
    object_type = "softwarerepository.Catalog"
  }

  nr_source {
    additional_properties = jsonencode({
      IsPasswordSet = false
      LocationLink  = each.value.link
      Username      = ""
    })
    object_type = "softwarerepository.HttpServer"
  }

  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
}

resource "intersight_firmware_server_configuration_utility_distributable" "scu" {
  // Intersight adds system-managed tag metadata to imported repository
  // entries, so ignore tag drift here to keep repeated applies idempotent.
  lifecycle {
    ignore_changes = [tags]
  }

  name        = "SCU 7.1.7.260200"
  description = local.description
  vendor      = "Cisco"
  nr_version  = "SCU 7.1.7.260200"
  // Scope the SCU import to the Unified Edge compute model this repo targets.
  supported_models = ["UCSXE-130C-M8"]

  catalog {
    moid        = data.intersight_softwarerepository_catalog.common_user_catalog.results[0].moid
    object_type = "softwarerepository.Catalog"
  }

  nr_source {
    additional_properties = jsonencode({
      IsPasswordSet = false
      LocationLink  = "http://10.135.5.2/scu/ucsxe-scu-7.1.7.260200.iso"
      Username      = ""
    })
    object_type = "softwarerepository.HttpServer"
  }

  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
}
