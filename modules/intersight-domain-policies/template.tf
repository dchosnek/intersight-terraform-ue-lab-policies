locals {
  // Policies in this list are attached to both child switch templates.
  unified_edge_common_policy_bucket = [
    {
      moid        = intersight_fabric_system_qos_policy.default_qos.moid
      object_type = "fabric.SystemQosPolicy"
    },
    {
      moid        = intersight_fabric_switch_control_policy.ue_switch_jumbo_frames.moid
      object_type = "fabric.SwitchControlPolicy"
    },
    {
      moid        = intersight_thermal_policy.ue_acoustic_fan.moid
      object_type = "thermal.Policy"
    },
    {
      moid        = intersight_power_policy.ue_grid_power.moid
      object_type = "power.Policy"
    },
    {
      moid        = intersight_iam_end_point_user_policy.local_user_policy.moid
      object_type = "iam.EndPointUserPolicy"
    },
    {
      moid        = intersight_syslog_policy.syslog_warning.moid
      object_type = "syslog.Policy"
    },
    {
      moid        = var.ntp_policy_moid
      object_type = "ntp.Policy"
    },
  ]

  // These entries define the per-switch policy bucket additions.
  // Today A and B are identical, but only port/VLAN-related policies should
  // differ between them, so we keep that split here instead of duplicating
  // the full switch profile template resources.
  unified_edge_switch_templates = {
    A = [
      {
        moid        = intersight_fabric_port_policy.ue_uplink_port_one.moid
        object_type = "fabric.PortPolicy"
      },
      {
        moid        = intersight_fabric_eth_network_policy.tenant10_1355_1356.moid
        object_type = "fabric.EthNetworkPolicy"
      },
    ]
    B = [
      {
        moid        = intersight_fabric_port_policy.ue_uplink_port_one.moid
        object_type = "fabric.PortPolicy"
      },
      {
        moid        = intersight_fabric_eth_network_policy.tenant10_1355_1356.moid
        object_type = "fabric.EthNetworkPolicy"
      },
    ]
  }
}

// Each physical switch side in the Unified Edge pair gets its own switch
// profile template. The child template owns the attached policies and must
// reference the parent switch cluster profile template.
resource "intersight_fabric_switch_profile_template" "unified_edge_switch_profile_template" {
  for_each = local.unified_edge_switch_templates

  name            = "unified-edge-switch-profile-template-${lower(each.key)}"
  target_platform = "Unified Edge"
  switch_id       = each.key

  switch_cluster_profile_template {
    moid        = intersight_fabric_switch_cluster_profile_template.unified_edge_profile_template.moid
    object_type = "fabric.SwitchClusterProfileTemplate"
  }

  // The full policy bucket for each switch is the shared set plus the
  // switch-specific port/VLAN-related policies from the local map above.
  dynamic "policy_bucket" {
    for_each = concat(local.unified_edge_common_policy_bucket, each.value)
    content {
      moid        = policy_bucket.value.moid
      object_type = policy_bucket.value.object_type
    }
  }

  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
}

// The switch cluster profile template is the parent container for the A/B
// switch profile templates. It represents the overall Unified Edge template.
resource "intersight_fabric_switch_cluster_profile_template" "unified_edge_profile_template" {
  name            = "tenant10-unified-edge"
  description     = "Unified Edge template for Tenant 10"
  target_platform = "Unified Edge"

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
