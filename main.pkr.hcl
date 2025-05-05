packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = ">= 1.0.8"
    }

    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">= 1.1.3"
    }
  }
}

source "docker" "alpine" {
  #image  = var.docker_image # references an image 
  commit = true
  pull   = false # without this option, it runs Docker pull
  run_command = ["-d","-i","-t","--name",var.ansible_host, "{{.Image}}", "/bin/sh"]
  build {
    path = "./docker/Dockerfile" # builds the image
  }

}

build {
  name = "build_docker_alpine"
  sources = [
    "source.docker.alpine"
  ]

  provisioner "ansible" {
    groups = ["webservers"]
    playbook_file = "./ansible/webserver.yml"
    extra_arguments = [
      "--extra-vars",
      "ansible_host=${var.ansible_host} ansible_connection=${var.ansible_connection} ansible_user=root ansible_python_interpreter=/usr/bin/python3 private_key_file=~/.ssh/ansible"

    ]
  }

  post-processor "docker-tag" {
    repository = "myrepo/ansible_python-alpine"
    tags       = ["3.21.3"]

  }
}
