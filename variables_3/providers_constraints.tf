terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=4.43.0, <4.47.0, !=4.43.0" 
        //terraform init -upgrade
        //tree .terraform
    }
  }
  required_version = "1.11.4"
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags //aplicamos a todos los recursos (tags genericos)
  }
}
