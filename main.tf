# Exercise 1
resource "github_repository" "tf_exercises" {
  name        = var.repo_name
  description = var.repo_description
  visibility  = "public"
  auto_init = true
}

resource "github_branch_default" "default" {
  repository = var.repo_name
  branch = var.main_branchname
}

resource "github_branch" "exercise_1" {
  repository = github_repository.tf_exercises.name
  branch = var.ex1_branchname
  source_branch = var.main_branchname
}

resource "github_repository_file" "readme_file" {
  repository          = var.repo_name
  file                = var.readme_filename
  content             = var.readme_content
  autocreate_branch   = true
  commit_message      = var.readme_commit_message
  overwrite_on_create = true
}

resource "github_repository_topics" "repo_topics" {
  repository = var.repo_name
  topics = var.repo_topics
}
