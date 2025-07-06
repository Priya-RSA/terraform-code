terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.2.0"
    }
  }
  backend "s3" {
    bucket  = "pri-terraform-test-bucket-state"
    key     = "dev/sales/terraform.tfstate"
    region  = "eu-west-1"
    profile = "development"
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "development"
  region  = "eu-west-1"
}

# Variable declaration 
variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

# create a aws resource and reference the vpc_cidr variable
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "Terraform_VPC"
  }
}                                                                                                       
