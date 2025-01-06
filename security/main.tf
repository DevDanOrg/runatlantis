data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.1"
    }

    null = {
      source = "hashicorp/null"
    }

    local = ">= 2.1.0"
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = ""
    key    = ""
    region = ""
    dynamodb_table = ""
  }
}

resource "aws_s3_bucket" "devdan_bucket" {
  bucket = "devdan-security"
}