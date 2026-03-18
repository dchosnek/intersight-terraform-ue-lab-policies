resource "intersight_access_policy" "imc_access" {
  name        = "tenant10-imc-access-1356"
  description = "IMC access policy using VLAN 1356"
  inband_vlan = 1356

  inband_ip_pool {
    moid        = var.ip_pool_moid
    object_type = "ippool.Pool"
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
