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
| [intersight_fabric_eth_network_policy.tenant10_1355_1356](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_eth_network_policy) | resource |
| [intersight_fabric_port_policy.ue_port_channel](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_port_policy) | resource |
| [intersight_fabric_port_policy.ue_uplink_port_one](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_port_policy) | resource |
| [intersight_fabric_switch_cluster_profile_template.unified_edge_profile_template](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_switch_cluster_profile_template) | resource |
| [intersight_fabric_switch_control_policy.ue_switch_jumbo_frames](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_switch_control_policy) | resource |
| [intersight_fabric_switch_profile_template.unified_edge_switch_profile_template](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_switch_profile_template) | resource |
| [intersight_fabric_system_qos_policy.default_qos](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_system_qos_policy) | resource |
| [intersight_fabric_uplink_pc_role.ue_port_channel_ports](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_uplink_pc_role) | resource |
| [intersight_fabric_uplink_role.ue_ethernet_port1](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_uplink_role) | resource |
| [intersight_fabric_vlan.chassis_vlans](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/fabric_vlan) | resource |
| [intersight_iam_end_point_user.admin_user](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user) | resource |
| [intersight_iam_end_point_user_policy.local_user_policy](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user_policy) | resource |
| [intersight_iam_end_point_user_role.admin_user_role](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/iam_end_point_user_role) | resource |
| [intersight_power_policy.ue_grid_power](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/power_policy) | resource |
| [intersight_power_policy.ue_non_redundant](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/power_policy) | resource |
| [intersight_syslog_policy.syslog_warning](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/syslog_policy) | resource |
| [intersight_thermal_policy.ue_acoustic_fan](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/thermal_policy) | resource |
| [intersight_thermal_policy.ue_balanced_fan](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/thermal_policy) | resource |
| [intersight_iam_end_point_role.admin_role](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/iam_end_point_role) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_local_user_password"></a> [local\_user\_password](#input\_local\_user\_password) | Password for the local endpoint admin user. | `string` | n/a | yes |
| <a name="input_ntp_policy_moid"></a> [ntp\_policy\_moid](#input\_ntp\_policy\_moid) | MOID of the NTP policy to attach to the Unified Edge switch profile template. | `string` | n/a | yes |
| <a name="input_org_moid"></a> [org\_moid](#input\_org\_moid) | Organization MOID where the domain policies will be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to domain policies. | `map(string)` | `{}` | no |

## Outputs

No outputs.
