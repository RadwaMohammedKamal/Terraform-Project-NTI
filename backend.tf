terraform {
  backend "s3" {
    bucket  = "terraform-s3-radwa"
    key     = "terraform-project-nti/terraform.tfstate"
    region  = "eu-north-1"
    encrypt = true
  }
}
