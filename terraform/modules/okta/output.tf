# output "groups" {
#   value = {
#     for k, v in okta_group.groups :
#     k => {
#       id          = v.id
#       name        = v.name
#       description = v.description
#     }
#   }
# }

output "users_by_group" {
  value = {
    for group_name, _ in var.okta_groups :
    group_name => [
      for user_name, user_data in var.okta_users :
      user_name if contains(user_data.groups, group_name)
    ]
  }
}