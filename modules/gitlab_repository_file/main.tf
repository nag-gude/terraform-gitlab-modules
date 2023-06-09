resource "gitlab_repository_file" "file" {
  project             = var.project
  file_path           = var.file_path
  branch              = var.branch_name
  content             = var.content
  author_email        = var.author_email
  author_name         = var.author_name
  commit_message      = var.commit_message
  execute_filemode    = var.execute_filemode
  start_branch        = var.start_branch

  lifecycle {
    ignore_changes = [
      file_name, content, author_email, author_name, commit_message
    ]
  }
}
