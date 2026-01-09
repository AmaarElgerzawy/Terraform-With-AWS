terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "ammar-terraform-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}