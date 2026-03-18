// ----------------------------------------------------------------------------
// Port one Ethernet uplink
// ----------------------------------------------------------------------------

resource "intersight_fabric_port_policy" "ue_uplink_port_one" {
  name         = "ue-uplink-port-one"
  description  = "only port one of eCMC is an uplink"
  device_model = "UCSXE-ECMC-G1"

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

// Port role: enable port 1 as an Ethernet uplink on "ue-port-one-active"
resource "intersight_fabric_uplink_role" "ue_ethernet_port1" {
  port_id           = 1
  slot_id           = 1
  aggregate_port_id = 0
  admin_speed       = "Auto"

  port_policy {
    object_type = "fabric.PortPolicy"
    moid        = intersight_fabric_port_policy.ue_uplink_port_one.moid
  }
}

// ----------------------------------------------------------------------------
// Port channel
// ----------------------------------------------------------------------------

// Port policy: uplink port-channel using ports 1 and 2
resource "intersight_fabric_port_policy" "ue_port_channel" {
  name         = "ue-port-channel"
  description  = "uplink port-channel using ports 1 and 2"
  device_model = "UCSXE-ECMC-G1"

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

// Port-channel members: ports 1 and 2 on "ue-port-channel"
resource "intersight_fabric_uplink_pc_role" "ue_port_channel_ports" {
  pc_id = 1
  ports {
    port_id           = 1
    slot_id           = 1
    aggregate_port_id = 0
  }
  ports {
    port_id           = 2
    slot_id           = 1
    aggregate_port_id = 0
  }
  admin_speed = "Auto"

  port_policy {
    object_type = "fabric.PortPolicy"
    moid        = intersight_fabric_port_policy.ue_port_channel.moid
  }
}
