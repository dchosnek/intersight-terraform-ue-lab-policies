## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_intersight"></a> [intersight](#requirement\_intersight) | >= 1.0.74, < 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_intersight"></a> [intersight](#provider\_intersight) | 1.0.77 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_intersight_domain_policies"></a> [intersight\_domain\_policies](#module\_intersight\_domain\_policies) | ./modules/intersight-domain-policies | n/a |
| <a name="module_intersight_server_policies"></a> [intersight\_server\_policies](#module\_intersight\_server\_policies) | ./modules/intersight-server-policies | n/a |

## Resources

| Name | Type |
|------|------|
| [intersight_ippool_pool.tenant10_management_1356](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/ippool_pool) | resource |
| [intersight_ntp_policy.rtp9_dmz_ntp](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/ntp_policy) | resource |
| [intersight_softwarerepository_operating_system_file.os](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/resources/softwarerepository_operating_system_file) | resource |
| [intersight_organization_organization.common_org](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/organization_organization) | data source |
| [intersight_softwarerepository_catalog.common_user_catalog](https://registry.terraform.io/providers/CiscoDevNet/intersight/latest/docs/data-sources/softwarerepository_catalog) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_local_user_password"></a> [local\_user\_password](#input\_local\_user\_password) | Password for the local endpoint admin users created by the modules. | `string` | n/a | yes |

## Outputs

No outputs.
