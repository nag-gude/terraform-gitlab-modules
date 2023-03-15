variable "project_name" {
  type        = string
  description = "The name of the project."
}

variable "allow_merge_on_skipped_pipeline" {
  type        = bool
  description = "Set to true if you want to treat skipped pipelines as if they finished with success."
  default     = false
}

variable "analytics_access_level" {
  type        = string
  description = "Set the analytics access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "archive_on_destroy" {
  type        = bool
  description = "Set to true to archive the project instead of deleting on destroy. If set to true it will entire omit the DELETE operation."
  default     = null
}

variable "archived" {
  type        = bool
  description = "Whether the project is in read-only mode (archived). Repositories can be archived/unarchived by toggling this parameter."
  default     = false
}

variable "auto_cancel_pending_pipelines" {
  type        = string
  description = "Auto-cancel pending pipelines. This isn't a boolean, but enabled/disabled."
  default     = "enabled"
}

variable "auto_devops_deploy_strategy" {
  type        = string
  description = "Auto Deploy strategy. Valid values are continuous, manual, timed_incremental."
  default     = "continuous"
}

variable "auto_devops_enabled" {
  type        = bool
  description = "Enable Auto DevOps for this project."
  default     = false
}

variable "autoclose_referenced_issues" {
  type        = bool
  description = "Set whether auto-closing referenced issues on default branch."
  default     = true
}

variable "avatar" {
  type        = string
  description = "A local path to the avatar image to upload."
  default     = null
}

variable "build_git_strategy" {
  type        = string
  description = "The Git strategy."
  default     = "fetch"
}

variable "build_timeout" {
  type        = number
  description = "The maximum amount of time, in seconds, that a job can run."
  default     = 3600
}

variable "builds_access_level" {
  type        = string
  description = "Set the builds access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "ci_config_path" {
  type        = string
  description = "Custom Path to CI config file."
  default     = ""
}

variable "ci_default_git_depth" {
  type        = number
  description = "Default number of revisions for shallow cloning."
  default     = 20
}

variable "ci_forward_deployment_enabled" {
  type        = bool
  description = "When a new deployment job starts, skip older deployment jobs that are still pending."
  default     = true
}

variable "ci_separated_caches" {
  type        = bool
  description = "Use separate caches for protected branches."
  default     = true
}

variable "container_registry_access_level" {
  type        = string
  description = "Set visibility of container registry, for this project. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "default_branch" {
  type        = string
  description = "The default branch for the project."
  default     = "main"
}

variable "description" {
  type        = string
  description = "A description of the project."
  default     = ""
}

variable "emails_disabled" {
  type        = bool
  description = "Disable email notifications."
  default     = false
}

variable "external_authorization_classification_label" {
  type        = string
  description = "The classification label for the project."
  default     = ""
}

variable "forking_access_level" {
  type        = string
  description = "Set the forking access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "group_with_project_templates_id" {
  type        = number
  description = "For group-level custom templates, specifies ID of group from which all the custom project templates are sourced. Leave empty for instance-level templates."
  default     = null
}

variable "import_url" {
  type        = string
  description = "Git URL to a repository to be imported."
  default     = null
}

variable "initialize_with_readme" {
  type        = bool
  description = "Create main branch with first commit containing a README.md file."
  default     = true
}

variable "issues_access_level" {
  type        = string
  description = "Set the issues access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "issues_template" {
  type        = string
  description = "Sets the template for new issues in the project."
  default     = ""
}

variable "lfs_enabled" {
  type        = bool
  description = "Enable LFS for the project."
  default     = true
}

variable "merge_commit_template" {
  type        = string
  description = "Template used to create merge commit message in merge requests."
  default     = ""
}

variable "merge_method" {
  type        = string
  description = "Set the merge method. Valid values are merge, rebase_merge, ff."
  default     = "merge"
}

variable "merge_pipelines_enabled" {
  type        = bool
  description = "Enable or disable merge pipelines."
  default     = false
}

variable "merge_requests_access_level" {
  type        = string
  description = "Set the merge requests access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "merge_requests_enabled" {
  type        = bool
  description = "Enable merge requests for the project."
  default     = true
}

variable "merge_requests_template" {
  type        = string
  description = "Sets the template for new merge requests in the project."
  default     = ""
}

variable "merge_trains_enabled" {
  type        = bool
  description = "Enable or disable merge trains. Requires merge_pipelines_enabled to be set to true to take effect."
  default     = false
}

variable "namespace_id" {
  type        = number
  description = "The namespace (group or user) of the project."
}

variable "only_allow_merge_if_all_discussions_are_resolved" {
  type        = bool
  description = "Set to true if you want allow merges only if all discussions are resolved."
  default     = false
}

variable "only_allow_merge_if_pipeline_succeeds" {
  type        = bool
  description = "Set to true if you want allow merges only if a pipeline succeeds."
  default     = true
}

variable "operations_access_level" {
  type        = string
  description = "Set the operations access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "packages_enabled" {
  type        = bool
  description = "Enable packages repository for the project."
  default     = true
}

variable "pages_access_level" {
  type        = string
  description = "Enable pages access control."
  default     = "private"
}

variable "path" {
  type        = string
  description = "The path of the repository."
  default     = null
}

variable "printing_merge_request_link_enabled" {
  type        = bool
  description = "Show link to create/view merge request when pushing from the command line."
  default     = true
}

variable "public_builds" {
  type        = bool
  description = "If true, jobs can be viewed by non-project members."
  default     = false
}

variable "remove_source_branch_after_merge" {
  type        = bool
  description = "Enable `Delete source branch` option by default for all new merge requests."
  default     = true
}

variable "repository_access_level" {
  type        = string
  description = "Set the repository access level. Valid values are disabled, private, enabled"
  default     = "enabled"
}

variable "repository_storage" {
  type        = string
  description = "Which storage shard the repository is on. (administrator only)"
  default     = ""
}

variable "request_access_enabled" {
  type        = bool
  description = "Allow users to request member access."
  default     = false
}

variable "requirements_access_level" {
  type        = string
  description = "Set the requirements access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "resolve_outdated_diff_discussions" {
  type        = bool
  description = "Automatically resolve merge request diffs discussions on lines changed with a push."
  default     = false
}

variable "security_and_compliance_access_level" {
  type        = string
  description = "Set the security and compliance access level. Valid values are disabled, private, enabled."
  default     = "private"
}

variable "shared_runners_enabled" {
  type        = bool
  description = "Enable shared runners for this project."
  default     = false
}

variable "skip_wait_for_default_branch_protection" {
  type        = bool
  description = "If true, the default behavior to wait for the default branch protection to be created is skipped."
  default     = null
}

variable "snippets_access_level" {
  type        = string
  description = "Set the snippets access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

variable "suggestion_commit_message" {
  type        = string
  description = "The commit message used to apply merge request suggestions."
  default     = ""
}

variable "template_name" {
  type        = string
  description = "When used without use_custom_template, name of a built-in project template. When used with use_custom_template, name of a custom project template. This option is mutually exclusive with template_project_id."
  default     = null
}

variable "template_project_id" {
  type        = string
  description = "When used with use_custom_template, project ID of a custom project template."
  default     = null
}

variable "topics" {
  type        = set(string)
  description = "The list of topics for the project."
  default     = null
}

variable "use_custom_template" {
  type        = bool
  description = "If true, jobs can be viewed by non-project members."
  default     = null
}

variable "visibility_level" {
  type        = string
  description = "Set to `public` to create a public project. Valid values are `private`, `internal`, `public`."
  default     = "private"
}

variable "wiki_access_level" {
  type        = string
  description = "Set the wiki access level. Valid values are disabled, private, enabled."
  default     = "enabled"
}

# push rules
variable "author_email_regex" {
  type        = string
  description = "All commit author emails must match this regex, e.g. @my-company.com$"
  default     = ""
}

variable "branch_name_regex" {
  type        = string
  description = "All branch names must match this regex, e.g. (feature|develop|main)*"
  default     = ""
}

variable "commit_committer_check" {
  type        = bool
  description = "Users can only push commits to this repository that were committed with one of their own verified emails."
  default     = true
}

variable "commit_message_negative_regex" {
  type        = string
  description = "No commit message is allowed to match this regex."
  default     = ""
}

variable "commit_message_regex" {
  type        = string
  description = "All commit messages must match this regex."
  default     = ""
}

variable "deny_delete_tag" {
  type        = bool
  description = "Deny deleting a tag."
  default     = false
}

variable "file_name_regex" {
  type        = string
  description = "All commited filenames must not match this regex, e.g. (jar|exe)$."
  default     = ""
}

variable "max_file_size" {
  type        = number
  description = "Maximum file size (MB)"
  default     = 0
}

variable "member_check" {
  type        = bool
  description = "Restrict commits by author (email) to existing GitLab users."
  default     = true
}

variable "prevent_secrets" {
  type        = bool
  description = "GitLab will reject any files that are likely to contain secrets."
  default     = true
}

variable "reject_unsigned_commits" {
  type        = bool
  description = "Reject commit when it is not signed through GPG."
  default     = false
}
