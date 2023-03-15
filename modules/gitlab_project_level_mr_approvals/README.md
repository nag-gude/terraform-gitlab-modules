# GitLab Project

This module allows to manage the lifecycle of a Merge Request-level approval rule.

## Usage

```hcl
module "example" {
  source = "terraform-gitlab-modules/modules/gitlab_project_level_mr_approvals"

  project_id                                     = 1234
  reset_approvals_on_push                        = true
  disable_overriding_approvers_per_merge_request = true
  merge_requests_author_approval                 = false
  merge_requests_disable_committers_approval     = true
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

module "this" {
  source = "terraform-gitlab-modules/modules/gitlab_project_level_mr_approvals"

  project_id                                     = 1234
  reset_approvals_on_push                        = true
  disable_overriding_approvers_per_merge_request = true
  merge_requests_author_approval                 = false
  merge_requests_disable_committers_approval     = true
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | The ID of the project to change MR approval configuration. | `number` | n/a | yes |
| disable\_overriding\_approvers\_per\_merge\_request | By default, users are able to edit the approval rules in merge requests. If set to true, the approval rules for all new merge requests will be determined by the default approval rules. | `bool` | `true` | no |
| merge\_requests\_author\_approval | Set to true if you want to allow merge request authors to self-approve merge requests. Authors also need to be included in the approvers list in order to be able to approve their merge request. | `bool` | `false` | no |
| merge\_requests\_disable\_committers\_approval | Set to true if you want to prevent approval of merge requests by merge request committers. | `bool` | `false` | no |
| require\_password\_to\_approve | Set to true if you want to require authentication when approving a merge request. | `bool` | `false` | no |
| reset\_approvals\_on\_push | Set to true if you want to remove all approvals in a merge request when new commits are pushed to its source branch. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| mr\_appoval\_id | The ID of the GitLab project level MR approval. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

- See the [`versions.tf`](versions.tf) file for required Terraform and provider versions.
- GitLab personal access token with the following permissions:
    - `api`
- A GitLab Project