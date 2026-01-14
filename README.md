## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.28.0 |
| <a name="requirement_okta"></a> [okta](#requirement\_okta) | ~> 6.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.28.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_okta"></a> [okta](#module\_okta) | ./modules/okta | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret_version.okta_private_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_identity_center_app_id"></a> [aws\_identity\_center\_app\_id](#input\_aws\_identity\_center\_app\_id) | Okta App ID for AWS IAM Identity Center | `string` | n/a | yes |
| <a name="input_okta_base_url"></a> [okta\_base\_url](#input\_okta\_base\_url) | n/a | `string` | n/a | yes |
| <a name="input_okta_client_id"></a> [okta\_client\_id](#input\_okta\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_okta_groups"></a> [okta\_groups](#input\_okta\_groups) | n/a | <pre>map(object({<br/>    description = string<br/>  }))</pre> | n/a | yes |
| <a name="input_okta_org_name"></a> [okta\_org\_name](#input\_okta\_org\_name) | n/a | `string` | n/a | yes |
| <a name="input_okta_private_key_id"></a> [okta\_private\_key\_id](#input\_okta\_private\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_okta_scopes"></a> [okta\_scopes](#input\_okta\_scopes) | n/a | `list(string)` | n/a | yes |
| <a name="input_okta_secret_id"></a> [okta\_secret\_id](#input\_okta\_secret\_id) | n/a | `string` | n/a | yes |
| <a name="input_okta_users"></a> [okta\_users](#input\_okta\_users) | n/a | <pre>map(object({<br/>    first_name = string<br/>    last_name  = string<br/>    email      = string<br/>    groups     = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_users_by_group"></a> [users\_by\_group](#output\_users\_by\_group) | n/a |

## Visual Proof of Resource Creation
The following screenshots were taken directly from the Okta Admin Console after applying this Terraform configuration. They confirm successful provisioning of users, groups, and group-to-app assignments.
### Okta Groups Created
This screenshot shows the groups provisioned by Terraform, including:
- 
- Finance
- DevOps
- Security
- 
![Screenshot](proof_of_creation/okta_groups.png)
---
### Group Memberships Assigned
Each user defined in `var.okta_users` was automatically assigned to the groups listed in their `groups` array using the `okta_group_memberships` resource.
![Screenshot](proof_of_creation/okta_users.png)
---
### AWS Identity Center App Assignment
Groups were assigned to the AWS IAM Identity Center Okta application using the `okta_app_group_assignments`.
![Screenshot](proof_of_creation/okta_aws_app_groups.png)
---
