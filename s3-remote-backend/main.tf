terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">3.0.0"
    }
  }

  # backend bucket exists in TorqueDemoPlayground aws account
  backend "s3" {
    bucket = "torque-terraform-backend"
    key    = "s3-demo"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.name
  acl    = var.acl
  force_destroy = true

  tags = {
    Name        = var.name
    Environment = "Dev"
  }
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}