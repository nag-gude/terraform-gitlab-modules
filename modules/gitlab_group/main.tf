resource "gitlab_group" "group" {
  name                               = var.group_name
  path                               = var.group_path
  auto_devops_enabled                = var.auto_devops_enabled
  default_branch_protection          = var.default_branch_protection
  description                        = var.description
  emails_disabled                    = var.emails_disabled
  lfs_enabled                        = var.lfs_enabled
  mentions_disabled                  = var.mentions_disabled
  parent_id                          = var.parent_id
  project_creation_level             = var.project_creation_level
  request_access_enabled             = var.request_access_enabled
  share_with_group_lock              = var.share_with_group_lock
  subgroup_creation_level            = var.subgroup_creation_level
  visibility_level                   = var.visibility_level
  membership_lock                    = var.membership_lock
  prevent_forking_outside_group      = var.prevent_forking_outside_group
  require_two_factor_authentication  = var.require_two_factor_authentication
  two_factor_grace_period            = var.two_factor_grace_period
  extra_shared_runners_minutes_limit = var.extra_shared_runners_minutes_limit
  shared_runners_minutes_limit       = var.shared_runners_minutes_limit
}
