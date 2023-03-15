# GitLab Branch

This module allows to manage the lifecycle of a repository branch.


## Usage

```hcl
module "gitlab_branch" {
  source = "terraform-gitlab-modules/modules/gitlab_branch"

  name    = "feature-1234"
  ref     = "main"
  project = "123"
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

# Create a project for the branch to use
resource "gitlab_project" "example" {
  name         = "example"
  description  = "An example project"
  namespace_id = gitlab_group.example.id
}

module "example" {
  source = "terraform-gitlab-modules/modules/gitlab_branch"

  name    = "example"
  ref     = "main"
  project = gitlab_project.example.id
}
```

## Naming your branch

As per the engineering practice guidance:

> Branches must be named in lowercase, using a-z, 0-9, and - symbols only. The name should reflect any of the following pattern.

For example, the following would be an acceptable branch name:

- main
- develop
- feature-*


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| branch\_name | The name for this branch. | `string` | n/a | yes |
| project | The ID of the project which the branch is created against. | `string` | n/a | yes |
| branch\_ref | The ref which the branch is created from. | `string` | `main` | yes |

## Outputs

| Name | Description |
|------|-------------|
| branch\_id | The GitLab branch ID. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

- See the [`versions.tf`](versions.tf) file for required Terraform and provider versions.
- GitLab personal access token with the following permissions:
    - `api`
- A GitLab Project