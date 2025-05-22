variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "ami" {
  description = "AMI value for EC2 instance"
  type        = string
  default     = "ami-08d70e59c07c61a3a"
}

variable "instance_type" {
  description = "Instance type value for EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "aws_region" {
  description = "Region value for aws provider"
  type        = string
  default     = "af-south-1"
}

variable "bucket_name" {
  description = "Name of s3 bucket"
  type        = string
  default     = "my-first-tf-bucket"
}

variable "tags" {
  description = "Value of tag for s3 bucket"
  type        = map(any)
  default     = { Name = "My Bucket", Environment = "Dev" }
}
