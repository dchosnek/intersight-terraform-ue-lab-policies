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
    from = "10.135.6.101"
    to   = "10.135.6.108"
  }
  ip_v4_blocks {
    from = "10.135.6.109"
    to   = "10.135.6.116"
  }
  ip_v4_blocks {
    from = "10.135.6.117"
    to   = "10.135.6.124"
  }
  ip_v4_blocks {
    from = "10.135.6.125"
    to   = "10.135.6.132"
  }
  ip_v4_blocks {
    from = "10.135.6.133"
    to   = "10.135.6.140"
  }
  ip_v4_blocks {
    from = "10.135.6.141"
    to   = "10.135.6.148"
  }
  ip_v4_blocks {
    from = "10.135.6.149"
    to   = "10.135.6.156"
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
