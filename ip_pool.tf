resource "intersight_ippool_pool" "tenant10_management_1356" {
  name             = "tenant10-vlan-1356"
  description      = "IP pool for Tenant 10 on VLAN 1356"
  assignment_order = "sequential" # the only supported value

  ip_v4_config {
    gateway     = "10.135.6.254"
    netmask     = "255.255.255.0"
    primary_dns = "64.102.6.247"
  }

  ip_v4_blocks {
    from = "10.135.6.20"
    to   = "10.135.6.35"
  }
  ip_v4_blocks {
    from = "10.135.6.36"
    to   = "10.135.6.51"
  }
  ip_v4_blocks {
    from = "10.135.6.52"
    to   = "10.135.6.67"
  }
  ip_v4_blocks {
    from = "10.135.6.68"
    to   = "10.135.6.85"
  }

  organization {
    moid        = data.intersight_organization_organization.common_org.results[0].moid
    object_type = "organization.Organization"
  }

  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
}
