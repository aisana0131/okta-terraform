# resource "okta_group_memberships" "memberships" {
#   for_each = var.okta_users

#   group_ids = [
#     for g in each.value.groups :
#     okta_group.groups[g].id
#   ]

#   users = [
#     okta_user.users[each.key].id
#   ]
# }

resource "okta_app_group_assignments" "aws_app_assignment" {
  app_id = var.aws_identity_center_app_id

  dynamic "group" {
    for_each = okta_group.groups

    content {
      id = group.value.id
    }
  }
}
