variable "branch_name" {
  type        = string
  description = "The name for this branch."
}

variable "project" {
  type        = string
  description = "The ID of the project which the branch is created against."
}

variable "branch_ref" {
  type        = string
  description = "The ref which the branch is created from."
  default     = "main"
}