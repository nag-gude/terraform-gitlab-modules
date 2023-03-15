# GitLab Branch Protection

This module allows to manage the lifecycle of a protected branch of a repository.

## Usage

```hcl
module "protect_branch" {
  source = "terraform-gitlab-modules/modules/gitlab_branch_protection"

  project                = "12345"
  branch                 = "main"
  push_access_level      = "developer"
  merge_access_level     = "maintainer"
  unprotect_access_level = "no one"
}
```

## Example

```hcl
variable "gitlab_token" {
  type        = string
  description = "GitLab personal access token for managing projects"
}

provider "gitlab" {
  token = var.gitlab_token
}

module "example" {
  source = "terraform-gitlab-modules/modules/gitlab_branch_protection"

  project                      = "12345"
  branch                       = "BranchProtected"
  push_access_level            = "developer"
  merge_access_level           = "maintainer"
  unprotect_access_level       = "no one"
  allow_force_push             = true
  code_owner_approval_required = true
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| protected\_branch | Name of the branch. | `string` | n/a | yes |
| project | The id of the project. | `string` | n/a | yes |
| allow\_force\_push | Can be set to true to allow users with push access to force push. | `bool` | `false` | no |
| code\_owner\_approval\_required | Can be set to true to require code owner approval before merging. | `bool` | `false` | no |
| merge\_access\_level | Access levels allowed to merge. Valid values are: `no one`, `developer`, `maintainer` | `string` | `maintainer` | no |
| push\_access\_level | Access levels allowed to push. Valid values are: `no one`, `developer`, `maintainer`. | `string` | `maintainer` | no |
| unprotect\_access\_level | Access levels allowed to unprotect. Valid values are: `developer`, `maintainer`, `no one`. | `string` | `no one` | no |
| allowed\_to\_merge | The ID of a GitLab user allowed to perform the merge action. | `list(number)` | `null` | no |
| allowed\_to\_push | The ID of a GitLab user allowed to perform the push action. | `list(number)` | `null` | no |
| allowed\_to\_unprotect | The ID of a GitLab user allowed to perform the unprotect action. | `list(number)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| branch\_protection\_id | The ID of the branch protection. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

- See the [`versions.tf`](versions.tf) file for required Terraform and provider versions.
- GitLab personal access token with the following permissions:
    - `api`
- A GitLab Project