variable "github_token" {
  type        = string
  description = "A temporary Github access token"
}

variable "repo_name" {
  type        = string
  description = "Github repository name"
}

variable "repo_description" {
  type        = string
  description = "Github repository description"
}

variable "readme_filename" {
    type = string
    description  = "Read me filename"
}

variable "readme_content" {
  type = string
  description = "The content of the readme file"
}

variable "readme_commit_message" {
  type = string
  description = "Readme file commit message"
}

variable "ex1_branchname" {
  type = string
  description = "Exercise 1 branch name"
}

variable "main_branchname" {
  type = string
  description = "The name of the main branch"
}

variable "repo_topics" {
  type = list(string)
  description = "A list of github repository topics"
}