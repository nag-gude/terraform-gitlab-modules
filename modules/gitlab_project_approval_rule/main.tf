resource "gitlab_project_approval_rule" "approval_rule" {
  project              = var.project
  name                 = var.approval_name
  approvals_required   = var.approvals_required
  user_ids             = var.user_ids
  group_ids            = var.group_ids
  protected_branch_ids = var.protected_branch_ids
  rule_type            = var.rule_type
}