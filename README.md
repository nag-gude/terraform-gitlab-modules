# Terraform GitLab Modules

This module handles the opinionated GitLab groups, projects creation and configuration of projects with the approval rules.

Sub modules are provided for creating the following resources.

- gitlab_group: This module allows to manage the lifecycle of a group.
- gitlab_project: This module allows to manage the lifecycle of a project.
- gitlab_branch: This module allows to manage the lifecycle of a repository branch.
- gitlab_branch_protection: This module allows to manage the lifecycle of a protected branch of a repository.
- gitlab_project_approval_rule: This module allows to manage the lifecycle of a project-level approval rule.
- gitlab_project_level_mr_approvals: This module allows to manage the lifecycle of a Merge Request-level approval rule.
- gitlab_repository_file: This module allows to manage the lifecycle of a file within a repository.


## Compatibility

This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+.


## Usage
There are multiple examples included in the README.md of the sub modules folder but simple usage is as follows:

```hcl
variable "gitlab_token" {
  type        = string
  description = "GitLab personal access token for managing projects"
}

provider "gitlab" {
  token = var.gitlab_token
}

module "group" {
  source = "terraform-gitlab-modules/modules/gitlab_group"

  name        = "Example"
  path        = "example"
  description = "An example group"
  parent_id   = 12345
}

module "my_gitlab_project" {
  source = "terraform-gitlab-modules/modules/gitlab_project"

  namesapce_id     = module.group.group_id
  name             = "example"
  description      = "My awesome codebase"
  visibility_level = "private"
}
```

## Requirements

- A GitLab account
- GitLab personal access token with the following permissions:
    - `api`
- See the `versions.tf` file for required Terraform and provider versions in the submodules.