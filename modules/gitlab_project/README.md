# GitLab Project

This module allows to manage the lifecycle of a project.

A project can either be created in a group or user namespace.

## Usage

```hcl
module "example" {
  source = "terraform-gitlab-modules/modules/gitlab_project"

  namespace_id = 123
  name         = "my-project"
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

resource "gitlab_group" "my_group" {
  name        = "my-group"
  path        = "my-group"
  description = "An example group"
  parent_id   = 1234
}

module "my_gitlab_project" {
  source = "terraform-gitlab-modules/modules/gitlab_project"

  namesapce_id     = gitlab_group.example.id
  name             = "example"
  description      = "My awesome codebase"
  visibility_level = "private"
}
```

## Naming your projects

As per the engineering practice guidance:

> Projects must be named in lowercase, using a-z, 0-9, and - symbols only. The name should reflect the contents and must not have any generic or repetitive prefixes or suffixes, or abbreviations, acronyms, or initialisms.

For example, the following would not be an acceptable project name:

```terraform
module "project" {
  source = "terraform-gitlab-modules/modules/gitlab_project"

  group_id = 123
  name     = "gitlab frontend"
}
```

Instead, it should be something like this:

```terraform
module "project" {
  source = "terraform-gitlab-modules/modules/gitlab_project"

  group_id = 123
  name     = "gitlab-frontend"
}
```

## Deleting your project

To avoid accidental destruction, particularly for modifications that require replacement, this module will not destroy the project resource. Unfortunately, Terraform only allows [literal values for lifecycle rules](https://www.terraform.io/docs/language/meta-arguments/lifecycle.html#literal-values-only), so this cannot be variable or conditional. As a result, the project should be manually deleted from GitLab and Terraform state.

- [Delete project in GitLab](https://docs.gitlab.com/ee/user/project/working_with_projects.html#delete-a-project)
- [Remove a resource from Terraform state](https://www.terraform.io/docs/cli/commands/state/rm.html)
    - e.g. `terraform state rm module.my_gitlab_project.gitlab_project.this`


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_name | The name of the project. | `string` | n/a | yes |
| allow\_merge\_on\_skipped\_pipeline | Set to true if you want to treat skipped pipelines as if they finished with success. | `bool` | `false` | no |
| analytics\_access\_level | Set the analytics access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| archive\_on\_destroy | Set to true to archive the project instead of deleting on destroy. If set to true it will entire omit the DELETE operation. | `bool` | `null` | no |
| archived | Whether the project is in read-only mode (archived). Repositories can be archived/unarchived by toggling this parameter. | `bool` | `false` | no |
| auto\_cancel\_pending\_pipelines | Auto-cancel pending pipelines. This isn't a boolean, but enabled/disabled. | `string` | `enabled` | no |
| auto\_devops\_deploy\_strategy | Auto Deploy strategy. Valid values are continuous, manual, timed_incremental. | `string` | `continuous` | no |
| auto\_devops\_enabled | Enable Auto DevOps for this project. | `bool` | `false` | no |
| autoclose\_referenced\_issues | Set whether auto-closing referenced issues on default branch. | `bool` | `true` | no |
| build\_git\_strategy | The Git strategy. | `string` | `fetch` | no |
| build\_timeout | The maximum amount of time, in seconds, that a job can run. | `number` | `3600` | no |
| builds\_access\_level | Set the builds access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| ci\_config\_path | Custom Path to CI config file. | `string` | `""` | no |
| ci\_default\_git\_depth | Default number of revisions for shallow cloning. | `number` | `20` | no |
| ci\_forward\_deployment\_enabled | When a new deployment job starts, skip older deployment jobs that are still pending. | `bool` | `true` | no |
| ci\_separated\_caches | Use separate caches for protected branches. | `bool` | `true` | no |
| container\_registry\_access\_level | Set visibility of container registry, for this project. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| default\_branch | The default branch for the project. | `string` | `main` | no |
| description | A description of the project. | `string` | `null` | no |
| emails\_disabled | Disable email notifications. | `bool` | `false` | no |
| forking\_access\_level | Set the forking access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| group\_with\_project\_templates\_id | For group-level custom templates, specifies ID of group from which all the custom project templates are sourced. Leave empty for instance-level templates. | `number` | `null` | no |
| import\_url | Git URL to a repository to be imported. | `string` | `null` | no |
| initialize\_with\_readme | Create main branch with first commit containing a README.md file. | `bool` | `false` | no |
| issues\_access\_level | Set the issues access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| issues\_template | Sets the template for new issues in the project. | `string` | `""` | no |
| lfs\_enabled | Enable LFS for the project. | `bool` | `true` | no |
| merge\_commit\_template | Template used to create merge commit message in merge requests. | `string` | `""` | no |
| merge\_method | Set the merge method. Valid values are merge, rebase_merge, ff. | `string` | `merge` | no |
| merge\_pipelines\_enabled | Enable or disable merge pipelines. | `bool` | `false` | no |
| merge\_requests\_access\_level | Set the merge requests access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| merge\_requests\_enabled | Enable merge requests for the project. | `bool` | `true` | no |
| merge\_requests\_template | Sets the template for new merge requests in the project. | `string` | `""` | no |
| merge\_trains\_enabled | Enable or disable merge trains. Requires merge_pipelines_enabled to be set to true to take effect. | `bool` | `false` | no |
| namespace_id | The namespace (group or user) of the project. | `number` | n/a | yes |
| only\_allow\_merge\_if\_all\_discussions\_are\_resolved | Set to true if you want allow merges only if all discussions are resolved. | `bool` | `false` | no |
| only\_allow\_merge\_if\_pipeline\_succeeds | Set to true if you want allow merges only if a pipeline succeeds. | `bool` | `true` | no |
| operations\_access\_level | Set the operations access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| packages\_enabled | Enable packages repository for the project. | `bool` | `true` | no |
| pages\_access\_level | Enable pages access control. | `string` | `private` | no |
| path | The path of the repository. | `string` | `null` | no |
| printing\_merge\_request\_link\_enabled | Show link to create/view merge request when pushing from the command line. | `bool` | `true` | no |
| public\_builds | If true, jobs can be viewed by non-project members. | `bool` | `false` | no |
| remove\_source\_branch\_after\_merge | Enable `Delete source branch` option by default for all new merge requests.. | `bool` | `true` | no |
| repository\_access\_level | Set the repository access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| request\_access\_enabled | Allow users to request member access. | `bool` | `false` | no |
| requirements\_access\_level | Set the requirements access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| resolve\_outdated\_diff\_discussions | Automatically resolve merge request diffs discussions on lines changed with a push. | `bool` | `false` | no |
| security\_and\_compliance\_access\_level | Set the security and compliance access level. Valid values are disabled, private, enabled. | `string` | `private` | no |
| shared\_runners\_enabled | Enable shared runners for this project. | `bool` | `false` | no |
| skip\_wait\_for\_default\_branch\_protection | If true, the default behavior to wait for the default branch protection to be created is skipped. | `bool` | `null` | no |
| snippets\_access\_level | Set the snippets access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| suggestion\_commit\_message | The commit message used to apply merge request suggestions. | `string` | `""` | no |
| template\_name | When used without use_custom_template, name of a built-in project template. When used with use_custom_template, name of a custom project template. This option is mutually exclusive with template_project_id. | `string` | `""` | no |
| template\_project\_id | When used with use_custom_template, project ID of a custom project template. | `string` | `null` | no |
| topics | The list of topics for the project. | `set(string)` | `null` | no |
| use\_custom\_template | If true, jobs can be viewed by non-project members. | `bool` | `null` | no |
| visibility\_level | Set to `public` to create a public project. Valid values are `private`, `internal`, `public`. | `string` | `private` | no |
| wiki\_access\_level | Set the wiki access level. Valid values are disabled, private, enabled. | `string` | `enabled` | no |
| author\_email\_regex | All commit author emails must match this regex, e.g. @my-company.com$. | `string` | `""` | no |
| branch\_name\_regex | All branch names must match this regex. | `string` | `""` | no |
| commit\_committer\_check | Users can only push commits to this repository that were committed with one of their own verified emails. | `bool` | `true` | no |
| commit\_message\_negative\_regex | No commit message is allowed to match this regex. | `string` | `""` | no |
| commit\_message\_regex | All commit messages must match this regex. | `string` | `""` | no |
| deny\_delete\_tag | Deny deleting a tag. | `bool` | `false` | no |
| file\_name\_regex | All commited filenames must not match this regex. | `string` | `""` | no |
| member\_check | Restrict commits by author email to existing GitLab users. | `bool` | `true` | no |
| prevent\_secrets | GitLab will reject any files that are likely to contain secrets. | `bool` | `true` | no |
| reject\_unsigned\_commits | Reject commit when it is not signed through GPG. | `bool` | `false` | no |


## Outputs

| Name | Description |
|------|-------------|
| project\_id | The ID of the GitLab project. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

- See the [`versions.tf`](versions.tf) file for required Terraform and provider versions.
- GitLab personal access token with the following permissions:
    - `api`
- A GitLab group
