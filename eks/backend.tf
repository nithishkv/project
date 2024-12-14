terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket         = "my-ews-bucket-12345"        # Replace with your bucket name
    region         = "ap-south-1"                  # Your desired region
    key            = "eks/terraform.tfstate"      # The path to store the state file
    dynamodb_table = "Lock-Files"                  # DynamoDB table for state locking
    encrypt        = true                          # Enable encryption for state file
  }
}

provider "aws" {
  region = var.aws-region
}


