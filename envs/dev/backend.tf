terraform {
  backend "s3" {
    bucket = "baseer-backend-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
