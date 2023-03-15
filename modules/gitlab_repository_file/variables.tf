variable "branch_name" {
  type        = string
  description = "Name of the branch to which to commit to."
  default     = "main"
}

variable "commit_message" {
  type        = string
  description = "Commit message."
}

variable "content" {
  type        = string
  description = "File content. If the content is not yet base64 encoded, it will be encoded automatically. No other encoding is currently supported, because of a GitLab API bug."
}

variable "file_path" {
  type        = string
  description = "The full path of the file. It must be relative to the root of the project without a leading slash."
}

variable "project" {
  type        = string
  description = "The name or ID of the project."
}

variable "author_email" {
  type        = string
  description = "Email of the commit author."
  default     = ""
}

variable "author_name" {
  type        = string
  description = "Name of the commit author."
  default     = "Terraform"
}

variable "execute_filemode" {
  type        = bool
  description = "Enables or disables the execute flag on the file."
  default     = false
}

variable "overwrite_on_create" {
  type        = bool
  description = "Enable overwriting existing files, defaults to false."
  default     = false
}

variable "start_branch" {
  type        = string
  description = "Name of the branch to start the new commit from."
  default     = ""
}