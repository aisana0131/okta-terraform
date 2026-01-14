resource "okta_group" "groups" {
  for_each    = var.okta_groups
  name        = each.key
  description = each.value.description
}

resource "okta_user" "users" {
  for_each = var.okta_users

  first_name = each.value.first_name
  last_name  = each.value.last_name
  login      = each.value.email
  email      = each.value.email
  lifecycle {
    ignore_changes = [
      # Prevent drift from Okta UI changes
      password,
      recovery_question,
    ]
  }
}

# resource "okta_app_saml" "aws" {
#   label = "AWS IAM Identity Center"

#   sso_url     = var.aws_sso_url
#   recipient   = var.aws_sso_url
#   destination = var.aws_sso_url

#   subject_name_id_template = "user.email"
#   subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
#   audience = "urn:amazon:webservices"
#   authn_context_class_ref = "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport"
#   response_signed     = true
#   signature_algorithm = "RSA_SHA256"
#   digest_algorithm    = "SHA256"

#   attribute_statements {
#     type  = "EXPRESSION"
#     name  = "email"
#     values = ["user.email"]
#   }

#     attribute_statements {
#     type  = "EXPRESSION"
#     name  = "groups"
#     values = ["appuser.groups"]
#   }


# }

# resource "okta_app_group_assignment" "aws_assignments" {
#   for_each = var.okta_groups

#   app_id   = okta_app_saml.aws.id
#   group_id = okta_group.groups[each.key].id
# }
