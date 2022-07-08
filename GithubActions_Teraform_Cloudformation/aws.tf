terraform {
  cloud {
    organization = "pydataco"
    workspaces {
      name = "terraform"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {

}

variable "ID" { # we overrode this in the command line of terraform run
  type = string
}

resource "aws_cloudformation_stack" "bucket" {
  name = "Test-Stack"
  parameters = {
    bucketID = var.ID # we parsed this value
  }
  template_body = file("${path.module}/bucket.yml")
}
