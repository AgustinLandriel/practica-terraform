terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.29"
    }
  }

  backend "s3" {
    bucket       = "terraform-state-chucho" # el mismo nombre del bucket
    key          = "prod/terraform.tfstate" # ← ruta del state DE DEV
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true # locking nativo de S3
  }
}


provider "aws" {
  region = "us-east-2"
}

