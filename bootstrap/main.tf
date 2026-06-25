#Provider configuration for AWS

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.29"
    }
  }
}


provider "aws" {
  region = "us-east-2"
}


## Creacion del bucket S3 para almacenar el estado de terraform

resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-state-chucho"
}

#Recurso para habilitar el versionamiento del bucket S3
resource "aws_s3_bucket_versioning" "tf_state" {

  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }

}

#Recurso para habilitar el cifrado del bucket S3

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


#Recurso para habilitar el bloqueo de acceso público del bucket S3
resource "aws_s3_bucket_public_access_block" "tf_state" {
  bucket                  = aws_s3_bucket.tf_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
