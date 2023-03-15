# GitLab Repository File

This module allows to manage the lifecycle of a file within a repository.

## Usage

```hcl
module "readme" {
  source = "terraform-gitlab-modules/modules/gitlab_repository_file"

  project        = "1234"
  file_path      = "README.md"
  branch         = "main"
  // content will be auto base64 encoded
  content        = "README file"
  author_email   = "terraform@example.com"
  author_name    = "Terraform"
  commit_message = "feature: add readme file"
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

resource "gitlab_group" "this" {
  name        = "example"
  path        = "example"
  description = "An example group"
}

resource "gitlab_project" "this" {
  name                   = "example"
  namespace_id           = gitlab_group.this.id
  initialize_with_readme = true
}

module "readme" {
  source = "terraform-gitlab-modules/modules/gitlab_repository_file"

  project        = gitlab_project.this.id
  file_path      = "README.md"
  branch         = "main"
  content        = base64encode("README file contentfor example project")
  author_email   = "terraform@example.com"
  author_name    = "Terraform"
  commit_message = "feature: add readme file"
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| branch\_name | Name of the branch to which to commit to. | `string` | `main` | yes |
| commit\_message | Commit message. | `string` | n/a | yes |
| content | File content. If the content is not yet base64 encoded, it will be encoded automatically. No other encoding is currently supported, because of a GitLab API bug. | `string` | n/a | yes |
| file\_path | The full path of the file. It must be relative to the root of the project without a leading slash. | `string` | n/a | yes |
| project | The name or ID of the project. | `string` | n/a | yes |
| author\_email | Email of the commit author. | `string` | `""` | no |
| author\_name | Name of the commit author. | `string` | `Terraform` | no |
| execute\_filemode | Enables or disables the execute flag on the file. | `bool` | `false` | no |
| overwrite\_on\_create | Enable overwriting existing files. | `bool` | `false` | no |
| start\_branch | Name of the branch to start the new commit from. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| file\_name | The filename. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

- See the [`versions.tf`](versions.tf) file for required Terraform and provider versions.
- GitLab personal access token with the following permissions:
    - `api`
- A GitLab Project