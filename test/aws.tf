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
  name = "Test Stack"
  parameters = {
    ID = "${github.run_id}"
  }
  template_body = file("~/frontend.yml")
}
