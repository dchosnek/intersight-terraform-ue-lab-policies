module "intersight_domain_policies" {
  source = "./modules/intersight-domain-policies"

  org_moid            = data.intersight_organization_organization.common_org.results[0].moid
  ntp_policy_moid     = intersight_ntp_policy.rtp9_dmz_ntp.moid
  local_user_password = var.local_user_password
  tags                = local.tags
}

module "intersight_server_policies" {
  source = "./modules/intersight-server-policies"

  org_moid            = data.intersight_organization_organization.common_org.results[0].moid
  ntp_policy_moid     = intersight_ntp_policy.rtp9_dmz_ntp.moid
  ip_pool_moid        = intersight_ippool_pool.tenant10_management_1356.moid
  local_user_password = var.local_user_password
  tags                = local.tags
}
