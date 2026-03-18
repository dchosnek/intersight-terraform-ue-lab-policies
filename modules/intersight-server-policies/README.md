## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [intersight_access_policy.imc_access](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/access_policy) | resource |
| [intersight_boot_precision_policy.ue_boot_order](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/boot_precision_policy) | resource |
| [intersight_boot_precision_policy.ue_boot_secure](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/boot_precision_policy) | resource |
| [intersight_compute_scrub_policy.bios_scrub](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/compute_scrub_policy) | resource |
| [intersight_fabric_eth_network_group_policy.tenant10_native](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_eth_network_group_policy) | resource |
| [intersight_iam_end_point_user.admin_user](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user) | resource |
| [intersight_iam_end_point_user_policy.local_user_policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user_policy) | resource |
| [intersight_iam_end_point_user_role.admin_user_role](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user_role) | resource |
| [intersight_kvm_policy.kvm1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/kvm_policy) | resource |
| [intersight_memory_policy.dimm_blocklisting](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/memory_policy) | resource |
| [intersight_power_policy.restore_always_off](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/power_policy) | resource |
| [intersight_power_policy.restore_last_state](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/power_policy) | resource |
| [intersight_server_profile_template.unified_edge_profile_template](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/server_profile_template) | resource |
| [intersight_storage_storage_policy.m2_raid](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/storage_storage_policy) | resource |
| [intersight_vnic_eth_if.interface_a](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_if) | resource |
| [intersight_vnic_eth_if.interface_b](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_if) | resource |
| [intersight_vnic_eth_qos_policy.default](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_eth_qos_policy) | resource |
| [intersight_vnic_lan_connectivity_policy.ue_two_nics](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/vnic_lan_connectivity_policy) | resource |
| [intersight_iam_end_point_role.admin_role](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_end_point_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_pool_moid"></a> [ip\_pool\_moid](#input\_ip\_pool\_moid) | MOID of the IP pool used by the IMC access policy. | `string` | n/a | yes |
| <a name="input_local_user_password"></a> [local\_user\_password](#input\_local\_user\_password) | Password for the local endpoint admin user. | `string` | n/a | yes |
| <a name="input_ntp_policy_moid"></a> [ntp\_policy\_moid](#input\_ntp\_policy\_moid) | MOID of the NTP policy to attach to the Unified Edge switch profile template. | `string` | n/a | yes |
| <a name="input_org_moid"></a> [org\_moid](#input\_org\_moid) | Organization MOID where the domain policies will be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to domain policies. | `map(string)` | `{}` | no |

## Outputs

No outputs.
