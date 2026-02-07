terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
  backend "s3" {
    bucket       = "irfan-terraform-state-file"
    key          = "prod/app/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true # ← This turns on native S3 locking
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "irfan-gh-workflow-bucket-test-01"
}

