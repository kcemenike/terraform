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

variable "params_ID" {
  type = string
}

resource "aws_cloudformation_stack" "bucket" {
  name = "Test-Stack"
  parameters = {
    ID = var.params_ID
  }
  template_body = file("${path.module}/frontend.yml")
}
