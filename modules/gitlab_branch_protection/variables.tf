variable "protected_branch" {
  type        = string
  description = "Name of the branch."
  default     = "main"
}

variable "project" {
  type        = string
  description = "The id of the project."
}

variable "allow_force_push" {
  type        = bool
  description = "Can be set to true to allow users with push access to force push."
  default     = false
}

variable "code_owner_approval_required" {
  type        = bool
  description = "Can be set to true to require code owner approval before merging."
  default     = false
}

variable "merge_access_level" {
  type        = string
  description = "Access levels allowed to merge. Valid values are: `no one`, `developer`, `maintainer`"
  default     = "maintainer"
}

variable "push_access_level" {
  type        = string
  description = "Access levels allowed to push. Valid values are: `no one`, `developer`, `maintainer`"
  default     = "maintainer"
}

variable "unprotect_access_level" {
  type        = string
  description = "Access levels allowed to unprotect. Valid values are: `developer`, `maintainer`, `no one`"
  default     = "no one"
}

variable "allowed_to_merge" {
  type        = list(number)
  description = "The ID of a GitLab user allowed to perform the merge action. Mutually exclusive with group_id."
  default     = null
}

variable "allowed_to_push" {
  type        = list(number)
  description = "The ID of a GitLab user allowed to perform the push action. Mutually exclusive with group_id."
  default     = null
}

variable "allowed_to_unprotect" {
  type        = list(number)
  description = "The ID of a GitLab user allowed to perform the unprotect action. Mutually exclusive with group_id."
  default     = null
}