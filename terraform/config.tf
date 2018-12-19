terraform {
  required_version = "~> 0.11.1"
}

provider "aws" {
  profile = "webblab"
  region  = "us-west-2"
}
