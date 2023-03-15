resource "gitlab_branch" "branch" {
  name    = var.branch_name
  ref     = var.branch_ref
  project = var.project
}