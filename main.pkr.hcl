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

source "docker" "ubuntu" {
  image = var.docker_ubuntu_image
  commit = true
  pull = false # without this option, it runs Docker pull

}

build {
  name = "build_docker_ubuntu"
  sources = [
    "source.docker.ubuntu"
  ]
}
