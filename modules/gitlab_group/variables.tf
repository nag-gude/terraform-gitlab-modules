variable "group_name" {
  type        = string
  description = "The name of the group."
}

variable "group_path" {
  type        = string
  description = "The path of the group."
}

variable "auto_devops_enabled" {
  type        = bool
  description = "Default to Auto DevOps pipeline for all projects within this group."
  default     = false
}

variable "default_branch_protection" {
  type        = number
  description = "Defaults to 2. See https://docs.gitlab.com/ee/api/groups.html#options-for-default_branch_protection"
  default     = 2
}

variable "description" {
  type        = string
  description = "The description of the group."
  default     = ""
}

variable "emails_disabled" {
  type        = bool
  description = "Disable email notifications."
  default     = false
}

variable "lfs_enabled" {
  type        = bool
  description = "Enable/disable Large File Storage (LFS) for the projects in this group."
  default     = true
}

variable "mentions_disabled" {
  type        = bool
  description = "Disable the capability of a group from getting mentioned."
  default     = false
}

variable "parent_id" {
  type        = number
  description = "Id of the parent group (creates a nested group)."
}

variable "project_creation_level" {
  type        = string
  description = "Determine if developers can create projects in the group. Can be `noone`, `maintainer`, or `developer`."
  default     = "maintainer"
}

variable "request_access_enabled" {
  type        = bool
  description = "Allow users to request member access."
  default     = false
}

variable "require_two_factor_authentication" {
  type        = bool
  description = "Require all users in this group to setup Two-factor authentication."
  default     = false
}

variable "share_with_group_lock" {
  type        = bool
  description = "Prevent sharing a project with another group within this group."
  default     = false
}

variable "subgroup_creation_level" {
  type        = string
  description = "Allowed to create subgroups. Can be `owner`, or `maintainer`."
  default     = "owner"
}

variable "two_factor_grace_period" {
  type        = number
  description = "Time before Two-factor authentication is enforced (in hours)."
  default     = 48
}

variable "visibility_level" {
  type        = string
  description = "The group's visibility. Can be `private`, `internal`, `public`."
  default     = "private"
}

variable "membership_lock" {
  type        = bool
  description = "Users cannot be added to projects in this group."
  default     = false
}

variable "extra_shared_runners_minutes_limit" {
  type        = number
  description = "Can be set by administrators only. Additional CI/CD minutes for this group."
  default     = 0
}

variable "shared_runners_minutes_limit" {
  type        = number
  description = "Can be set by administrators only. Maximum number of monthly CI/CD minutes for this group. Can be nil (default; inherit system default), 0 (unlimited), or > 0."
  default     = 0
}

variable "prevent_forking_outside_group" {
  type        = bool
  description = "When enabled, users can not fork projects from this group to external namespaces."
  default     = true
}
