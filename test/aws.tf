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

resource "aws_cloudformation_stack" "test" {
  name = "Test-Stack"
  parameters = {
    ID = "$TF_VARS_ID"
  }
  template_body = file("${path.module}/frontend.yml")
}
