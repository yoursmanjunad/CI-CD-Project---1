terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = var.region
}
module "vpc" {
  source = "./vpc.tf"
}
module "ec2" {
  source = "./ec2.tf"
}
module "s3" {
  source = "./s3.tf"
}
module "dynamodb" {
  source = "./dynnamodb.tf"
}
module "iam" {
  source = "./iam.tf"
}
module "security_groups" {
  source = "./security_groups.tf"
}
