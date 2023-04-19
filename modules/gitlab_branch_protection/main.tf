resource "gitlab_branch_protection" "main" {
  project                      = var.project
  branch                       = var.protected_branch
  allow_force_push             = var.allow_force_push
  code_owner_approval_required = var.code_owner_approval_required
  merge_access_level           = var.merge_access_level
  push_access_level            = var.push_access_level

  dynamic "allowed_to_merge" {
    for_each = var.allowed_to_merge == null ? [] : var.allowed_to_merge
    content {
      user_id = allowed_to_merge.value
    }
  }

  dynamic "allowed_to_push" {
    for_each = var.allowed_to_push == null ? [] : var.allowed_to_push
    content {
      user_id = allowed_to_push.value
    }
  }

  dynamic "allowed_to_unprotect" {
    for_each = var.allowed_to_unprotect == null ? [] : var.allowed_to_unprotect
    content {
      user_id = allowed_to_unprotect.value
    }
  }
}
