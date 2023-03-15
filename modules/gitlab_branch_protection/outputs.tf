output "branch_protection_id" {
  value       = gitlab_branch_protection.main.branch_protection_id
  description = "The ID of the branch protection."
}