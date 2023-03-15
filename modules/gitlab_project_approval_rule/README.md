# GitLab Project

This module allows to manage the lifecycle of a project-level approval rule.

## Usage

```hcl
module "example" {
  source = "terraform-gitlab-modules/modules/gitlab_project_approval_rule"

  project            = 5
  name               = "Example Rule"
  approvals_required = 3
  user_ids           = [50, 500]
  group_ids          = [51]
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
  source = "terraform-gitlab-modules/modules/gitlab_project_approval_rule"

  project            = "12345"
  name               = "Example Rule"
  approvals_required = 1
  user_ids           = [50, 500]
  group_ids          = [51]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| approval\_name | The name of the approval rule. | `string` | n/a | yes |
| project | The name or id of the project to add the approval rules. | `string` | n/a | yes |
| approvals\_required | The number of approvals required for this rule. | `number` | `1` | yes |
| group\_ids | A list of group IDs whose members can approve of the merge request. | `list(number)` | `null` | no |
| protected\_branch\_ids | A list of protected branch IDs (not branch names) for which the rule applies. | `list(number)` | `null` | no |
| rule\_type | The type of rule. Valid values are regular, any_approver. | `string` | `regular` | no |
| user\_ids | A list of users to add to the list of approvers. | `set(number)` | `[]` | yes |

## Outputs

| Name | Description |
|------|-------------|
| approval\_id | The ID of the approval. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

- See the [`versions.tf`](versions.tf) file for required Terraform and provider versions.
- GitLab personal access token with the following permissions:
    - `api`
- A GitLab project