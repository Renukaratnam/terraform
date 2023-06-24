# configure aws provider

provider "aws" {
  region     = "ap-south-1a"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
