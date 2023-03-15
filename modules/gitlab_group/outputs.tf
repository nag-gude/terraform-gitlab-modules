output "full_path" {
  value       = gitlab_group.group.full_path
  description = "The full path of the group."
}

output "group_id" {
  value       = gitlab_group.group.id
  description = "The ID of group created."
}