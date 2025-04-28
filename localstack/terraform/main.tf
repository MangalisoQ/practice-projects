terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.16"
    }
  }
}


provider "aws" {
  region = "af-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "my-first-tf-bucket"

  tags = {
    Name        = "My Bucket"
    Environment = "Dev"
  }
}
