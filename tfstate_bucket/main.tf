terraform {
  backend "local" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  access_key = var.minio_access_key
  secret_key = var.minio_secret_key
  region     = "ap-northeast-1"

  s3_use_path_style = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true

  endpoints {
    s3  = "http://192.168.1.3:9000"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
