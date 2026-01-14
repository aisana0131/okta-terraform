variable "okta_org_name"       { type = string }
variable "okta_base_url"       { type = string }
variable "okta_client_id"      { type = string }
variable "okta_scopes"         { type = list(string) }
variable "okta_private_key_id" { type = string }
variable "okta_secret_id"      { type = string }

variable "region" {type = string  }

variable "aws_identity_center_app_id" {
  type        = string
  description = "Okta App ID for AWS IAM Identity Center"
}

# variable "aws_sso_url" {
#   type        = string
#   description = "AWS IAM Identity Center SSO URL (https://d-xxxx.awsapps.com/start)"
# }

variable "okta_users" {
  type = map(object({
    first_name = string
    last_name  = string
    email      = string
    groups     = list(string)
  }))
}

variable "okta_groups" {
  type = map(object({
    description = string
  }))
}