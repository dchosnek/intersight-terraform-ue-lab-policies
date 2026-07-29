locals {
  trunk = {
    vlan1355 = 1355
    vlan1356 = 1356
    vlan1357 = 1357
    vlan1358 = 1358
    vlan1359 = 1359
  }
  secure_router_vlans = {
    vlan2112 = 2112
    vlan2113 = 2113
    vlan2114 = 2114
    vlan2115 = 2115
    vlan2116 = 2116
  }
}

// ============================================================================
// Tenant 10 VLANs for external connectivity
// ----------------------------------------------------------------------------

resource "intersight_fabric_vlan" "chassis_vlans" {
  for_each = local.trunk

  auto_allow_on_uplinks = true
  is_native             = false
  name                  = each.key
  vlan_id               = each.value
  eth_network_policy {
    moid        = intersight_fabric_eth_network_policy.tenant10_1355_1356.moid
    object_type = "fabric.EthNetworkPolicy"
  }
}

// Eth network policy: "rtp-trunk-1355-1359"
resource "intersight_fabric_eth_network_policy" "tenant10_1355_1356" {
  name            = "tenant10-trunk"
  description     = "Tenant 10 VLANs 1355-1359, no native"
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

// ============================================================================
// Backplane VLANs
// ----------------------------------------------------------------------------
resource "intersight_fabric_vlan" "backplane_vlans" {
  for_each = local.secure_router_vlans

  auto_allow_on_uplinks = false
  is_native             = false
  name                  = each.key
  vlan_id               = each.value

  eth_network_policy {
    moid        = intersight_fabric_eth_network_policy.backplane_eng.moid
    object_type = "fabric.EthNetworkPolicy"
  }
}

resource "intersight_fabric_eth_network_policy" "backplane_eng" {
  name            = "backplane-vlans"
  description     = "Backplane VLANs 2112-2116, no native"
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


// Switch control policy: "ue-switch-jumbo-frames"
resource "intersight_fabric_switch_control_policy" "ue_switch_jumbo_frames" {
  name               = "ue-switch-jumbo-frames"
  description        = "enable jumbo frames"
  enable_jumbo_frame = true
  // this seems to be the default mode for Unified Edge
  ethernet_switching_mode = "switch"
  target_platform         = "Unified Edge"

  mac_aging_settings {
    mac_aging_option = "Default"
    mac_aging_time   = 300
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

resource "intersight_fabric_system_qos_policy" "default_qos" {
  name            = "ue-default-qos"
  description     = "Unified Edge chassis default QoS policy"
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
