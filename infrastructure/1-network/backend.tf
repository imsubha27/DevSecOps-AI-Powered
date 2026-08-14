terraform {
  backend "s3" {
    bucket = "devsecops-ai-27"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "tfstate-lock"
    encrypt        = true
  }
}