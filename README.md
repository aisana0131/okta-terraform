## Outputs

| Name | Description |
|------|-------------|
| <a name="output_users_by_group"></a> [users_by_group](#output_users_by_group) | A map of group names to the list of users assigned to each group. Useful for auditing and debugging group memberships. |
| <a name="output_group_ids"></a> [group_ids](#output_group_ids) | A map of group names to their Okta group IDs. |
| <a name="output_user_ids"></a> [user_ids](#output_user_ids) | A map of usernames to their Okta user IDs. |

---

## Visual Proof of Resource Creation

The following screenshots were taken directly from the Okta Admin Console after applying this Terraform configuration. They confirm successful provisioning of users, groups, and group-to-app assignments.

### Okta Groups Created

This screenshot shows the groups provisioned by Terraform, including:
- 
- Finance
- DevOps
- Security
- 

(proof_of_creation/okta_groups.png)

---

### Group Memberships Assigned

Each user defined in `var.okta_users` was automatically assigned to the groups listed in their `groups` array using the `okta_group_memberships` resource.

(proof_of_creation/okta_users.png)

---

### AWS Identity Center App Assignment

Groups were assigned to the AWS IAM Identity Center Okta application using the `okta_app_group_assignments`.

_(proof_of_creation/okta_aws_app_groups.png)_

---
