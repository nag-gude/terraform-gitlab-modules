output "mr_appoval_id" {
  value       = gitlab_project_level_mr_approvals.mr_approvals.id
  description = "The ID of the GitLab project level MR approval."
}