terraform {
  backend "s3" {
    bucket  = "terraform-state-bia"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    profile = "bia-terraform"
  }
}
