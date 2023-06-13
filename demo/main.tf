terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.3.0"
    }
  }

  required_version = ">= 1.5.0"

}

provider "aws" {
    region = "us-east-2"
}

import {
  id = "i-06660efc02ae3d2a9"
 
  to = aws_instance.dev_box
}

import {
  id = "import-test-3523"
 
  to = aws_s3_bucket.test_bucket
}