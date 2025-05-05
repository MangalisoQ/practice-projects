variable "docker_image" {
  description = "Docker image type"
  type        = string
}

variable "ansible_host" {
  type = string
}

variable "ansible_connection" {
  type = string
}

variable "ansible_user" {
  type = string
}
