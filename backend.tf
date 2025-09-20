terraform {
  backend "s3" {
    bucket         = "devtfbucket533267238276--aps1-az1--x-s3"
    key            = "global/dev01/dev01-terraform.tfstate"
    region         = "ap-south-1"
  }
}