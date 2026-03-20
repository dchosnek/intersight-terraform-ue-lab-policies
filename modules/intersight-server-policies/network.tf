// This VLAN group is shared by both server-facing vNICs.
resource "intersight_fabric_eth_network_group_policy" "tenant10_native" {
  name        = "tenant-10-server-vlans"
  description = "native VLAN for server"
  vlan_settings {
    native_vlan   = 1355
    allowed_vlans = "1355,1356"
    object_type   = "fabric.VlanSettings"
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

// The LAN Connectivity Policy is the parent policy that owns the vNIC set.
// Each vNIC references this policy directly when it is created.
resource "intersight_vnic_lan_connectivity_policy" "ue_two_nics" {
  name            = "ue-lan-connectivity"
  description     = "demo vnic lan connectivity policy"
  placement_mode  = "auto"
  target_platform = "UnifiedEdgeServer"

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

// Intersight requires an Ethernet QoS policy on each vNIC, so both interfaces
// reuse this shared default policy.
resource "intersight_vnic_eth_qos_policy" "default" {
  name        = "ue-ethernet-qos"
  description = "Default Ethernet QoS policy for Unified Edge server vNICs"

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

// vNIC-A and vNIC-B are separate child objects under the same LAN Connectivity
// Policy. They share VLAN/QoS settings, but differ by fabric placement.
resource "intersight_vnic_eth_if" "interface_a" {
  name = "vNIC-A"

  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.ue_two_nics.moid
    object_type = "vnic.LanConnectivityPolicy"
  }

  eth_qos_policy {
    moid        = intersight_vnic_eth_qos_policy.default.moid
    object_type = "vnic.EthQosPolicy"
  }

  placement {
    auto_slot_id             = true
    pci_link_assignment_mode = "Custom"
    switch_id                = "A"
  }

  fabric_eth_network_group_policy {
    moid        = intersight_fabric_eth_network_group_policy.tenant10_native.moid
    object_type = "fabric.EthNetworkGroupPolicy"
  }
}

resource "intersight_vnic_eth_if" "interface_b" {
  name = "vNIC-B"

  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.ue_two_nics.moid
    object_type = "vnic.LanConnectivityPolicy"
  }

  eth_qos_policy {
    moid        = intersight_vnic_eth_qos_policy.default.moid
    object_type = "vnic.EthQosPolicy"
  }

  placement {
    auto_slot_id             = true
    pci_link_assignment_mode = "Custom"
    switch_id                = "B"
  }

  fabric_eth_network_group_policy {
    moid        = intersight_fabric_eth_network_group_policy.tenant10_native.moid
    object_type = "fabric.EthNetworkGroupPolicy"
  }
}
