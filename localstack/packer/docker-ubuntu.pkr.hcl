packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = ">= 1.0.8"
    }

    ansible = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

variable "docker_image" {
  description = "Docker image type"
  type        = string
  default     = "ubuntu:24.10"
}

variable "ansible_host" {
  type    = string
  default = "mangalisomichaelqoshe"
}

variable "ansible_connection" {
  type    = string
  default = "docker"
}


source "docker" "ubuntu" {
  image       = var.docker_image
  pull = false
  commit      = true
  run_command = ["-d", "-i", "-t", "--name", var.ansible_host, "{{.Image}}", "/bin/bash"]
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "ansible" {
      groups        = ["webserver"]
    playbook_file = "./webserver.yml"
    extra_arguments = [
      "-vvv",
      "--extra-vars",
      "ansible_host=${var.ansible_host} ansible_connection=${var.ansible_connection} ansible_user=root ansible_python_interpreter=/usr/bin/python3 private_key_file=~/.ssh/ansible"
    ]
  }

  post-processor "docker-tag" {

    repository = "hashicorp/packer"
    tags       = ["Oracular-24.10"]
  }
}
