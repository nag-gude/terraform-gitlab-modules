variable "project" {
  type        = string
  description = "The name or id of the project to add the approval rules."
}

variable "approval_name" {
  type        = string
  description = "The name of the approval rule."
}

variable "approvals_required" {
  type        = number
  description = "The number of approvals required for this rule."
  default     = 1
}

variable "group_ids" {
  type        = list(number)
  description = "A list of group IDs whose members can approve of the merge request."
  default     = null
}

variable "protected_branch_ids" {
  type        = list(number)
  description = "A list of protected branch IDs (not branch names) for which the rule applies."
  default     = null
}

variable "rule_type" {
  type        = string
  description = "The type of rule. Valid values are regular, any_approver."
  default     = "regular"
}

variable "user_ids" {
  type        = set(number)
  description = "A list of users to add to the list of approvers."
  default     = []
}