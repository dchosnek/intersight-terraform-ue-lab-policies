resource "intersight_ntp_policy" "rtp9_dmz_ntp" {
  name        = "tenant10-ntp"
  description = "NTP servers in the RTP9 DMZ"
  enabled     = true
  timezone    = "America/New_York"
  ntp_servers = [
    "172.26.163.51",
    "172.26.163.52",
    "172.26.163.53",
    "172.26.163.54"
  ]
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
