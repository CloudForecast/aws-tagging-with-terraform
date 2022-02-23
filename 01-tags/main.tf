terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
        Env = "Dev"
        Team = "Devops"
    }
  }
}

resource "random_id" "s3_id" {
  byte_length = 2
}

resource "aws_s3_bucket" "private_bucket" {
  bucket = "cloudforecast-private-${random_id.s3_id.dec}"

  tags = {
    Service = "S3"
    Public  = "False"
  }
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "cloudforecast-public-${random_id.s3_id.dec}"

  tags = {
    Service = "S3"
    Team    = "Frontend"
    Public  = "True"
  }
}

resource "aws_s3_bucket_acl" "private" {
  bucket = aws_s3_bucket.private_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_acl" "public-read" {
  bucket = aws_s3_bucket.public_bucket.id
  acl    = "public-read"
}