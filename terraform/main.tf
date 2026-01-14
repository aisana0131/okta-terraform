provider "okta" {
  org_name       = var.okta_org_name
  base_url       = var.okta_base_url
  client_id      = var.okta_client_id
  scopes         = var.okta_scopes
  private_key_id = var.okta_private_key_id
  private_key    = data.aws_secretsmanager_secret_version.okta_private_key.secret_string
}

data "aws_secretsmanager_secret_version" "okta_private_key" {
  secret_id = var.okta_secret_id
}

module "okta" {
  source = "./modules/okta"
  okta_users  = var.okta_users
  okta_groups = var.okta_groups
  # aws_sso_url = var.aws_sso_url
  aws_identity_center_app_id = var.aws_identity_center_app_id

}

output "users_by_group" {
  value = module.okta.users_by_group
}