output "approval_id" {
  value       = gitlab_project_approval_rule.approval_rule.id
  description = "The ID of the approval."
}
