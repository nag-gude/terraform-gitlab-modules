# GitLab Branch

This module allows to manage the lifecycle of a group.

## Usage
```hcl
module "group" {
  source = "terraform-gitlab-modules/modules/gitlab_group"

  name        = "example"
  path        = "example"
  description = "An example group"
  parent_id   = 1234
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

module "group" {
  source = "terraform-gitlab-modules/modules/gitlab_group"

  name        = "example"
  path        = "example"
  description = "An example group"
  parent_id   = 1234
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| group\_name | The name of the group | `string` | n/a | yes |
| group\_path | The path of the group | `string` | n/a | yes |
| auto\_devops\_enabled | Default to Auto DevOps pipeline for all projects within this group | `bool` | `false` | no |
| avatar | A local path to the avatar image to upload | `string` | `null` | no |
| default\_branch\_protection | See https://docs.gitlab.com/ee/api/groups.html#options-for-default_branch_protection | `number` | `2` | yes |
| description | The description of the group | `string` | `null` | no |
| emails\_disabled | Disable email notifications | `bool` | `false` | no |
| lfs\_enabled | Enable/disable Large File Storage (LFS) for the projects in this group | `bool` | `true` | no |
| mentions\_disabled | Disable the capability of a group from getting mentioned | `bool` | `false` | no |
| parent\_id | Id of the parent group (creates a nested group). | `number` | `n/a` | yes |
| project\_creation\_level | Determine if developers can create projects in the group. Can be `noone`, `maintainer`, or `developer`. | `string` | `maintainer` | no |
| request\_access\_enabled | Allow users to request member access | `bool` | `false` | no |
| require\_two\_factor\_authentication | Require all users in this group to setup Two-factor authentication | `bool` | `false` | no |
| share\_with\_group\_lock | Prevent sharing a project with another group within this group | `bool` | `false` | no |
| two\_factor\_grace\_period | Time before Two-factor authentication is enforced (in hours) | `number` | `48` | no |
| visibility\_level | The group's visibility. Can be `private`, `internal`, `public` | `string` | `private` | no |
| membership\_lock | Users cannot be added to projects in this group | `bool` | `false` | no |
| extra\_shared\_runners\_minutes\_limit | Can be set by administrators only. Additional CI/CD minutes for this group | `number` | `0` | no |
| shared\_runners\_minutes\_limit | Can be set by administrators only. Maximum number of monthly CI/CD minutes for this group. Can be nil (default; inherit system default), 0 (unlimited), or > 0 | `number` | `0` | no |
| prevent\_forking\_outside\_group | When enabled, users can not fork projects from this group to external namespaces. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| full\_path | The full path of the group. |
| group\_id | The ID of group created. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

- See the [`versions.tf`](versions.tf) file for required Terraform and provider versions.
- GitLab personal access token with the following permissions:
    - `api`
