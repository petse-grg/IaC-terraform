
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# provider
provider "aws" {
  region = var.region
}
