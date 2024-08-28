terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "object" {
  bucket = resource.aws_s3_bucket.default.id
  key    = "myfile.txt"
  source = "myfile.txt"

  etag = filemd5("myfile.txt")
}