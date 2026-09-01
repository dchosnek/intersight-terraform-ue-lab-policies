locals {
  // These are the server policies that should be applied consistently to the
  // Unified Edge server profile template.
  unified_edge_server_policy_bucket = [
    {
      moid        = intersight_boot_precision_policy.ue_boot_secure.moid
      object_type = "boot.PrecisionPolicy"
    },
    {
      moid        = intersight_access_policy.imc_access.moid
      object_type = "access.Policy"
    },
    {
      moid        = intersight_memory_policy.dimm_blocklisting.moid
      object_type = "memory.Policy"
    },
    {
      moid        = intersight_compute_scrub_policy.bios_scrub.moid
      object_type = "compute.ScrubPolicy"
    },
    # {
    #   moid        = intersight_kvm_policy.tunneled_kvm.moid
    #   object_type = "kvm.Policy"
    # },
    {
      moid        = intersight_power_policy.restore_last_state.moid
      object_type = "power.Policy"
    },
    {
      moid        = intersight_iam_end_point_user_policy.local_user_policy.moid
      object_type = "iam.EndPointUserPolicy"
    },
    {
      moid        = intersight_storage_storage_policy.m2_raid.moid
      object_type = "storage.StoragePolicy"
    },
    {
      moid        = intersight_vnic_lan_connectivity_policy.ue_two_nics.moid
      object_type = "vnic.LanConnectivityPolicy"
    },
    {
      moid        = intersight_bios_policy.ue_bios_serial_redirect.moid
      object_type = "bios.Policy"
    },
    {
      moid        = intersight_sol_policy.ue_enable_sol.moid
      object_type = "sol.Policy"
    },
  ]
}

// The server profile template is the server-side peer to the Unified Edge
// switch cluster template in the domain module. It carries the server policies
// that should be applied uniformly to Unified Edge servers.
resource "intersight_server_profile_template" "unified_edge_profile_template" {
  name            = "tenant10-ue-server"
  description     = "Unified Edge server profile template for Tenant 10"
  target_platform = "UnifiedEdgeServer"

  dynamic "policy_bucket" {
    for_each = local.unified_edge_server_policy_bucket
    content {
      moid        = policy_bucket.value.moid
      object_type = policy_bucket.value.object_type
    }
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
