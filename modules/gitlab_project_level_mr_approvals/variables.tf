variable "project_id" {
  type        = number
  description = "The ID of the project to change MR approval configuration."
}

variable "disable_overriding_approvers_per_merge_request" {
  type        = bool
  description = "By default, users are able to edit the approval rules in merge requests. If set to true, the approval rules for all new merge requests will be determined by the default approval rules."
  default     = true
}

variable "merge_requests_author_approval" {
  type        = bool
  description = "Set to true if you want to allow merge request authors to self-approve merge requests. Authors also need to be included in the approvers list in order to be able to approve their merge request."
  default     = false
}

variable "merge_requests_disable_committers_approval" {
  type        = bool
  description = "Set to true if you want to prevent approval of merge requests by merge request committers."
  default     = false
}

variable "require_password_to_approve" {
  type        = bool
  description = "Set to true if you want to require authentication when approving a merge request."
  default     = false
}

variable "reset_approvals_on_push" {
  type        = bool
  description = "Set to true if you want to remove all approvals in a merge request when new commits are pushed to its source branch."
  default     = true
}
