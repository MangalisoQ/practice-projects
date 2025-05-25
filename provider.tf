terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
  }
}

provider "http" {}

module "http_testing" {
  source = "./modules/http-testing"

  icanhazdadjoke_api = var.icanhazdadjoke_api
  ipify_api          = var.ipify_api
  github_zen_api     = var.github_zen_api

  zen_file            = var.zen_file
  ipify_file          = var.ipify_file
  icanhazdadjoke_file = var.icanhazdadjoke_file

  summary_file = var.summary_file
}