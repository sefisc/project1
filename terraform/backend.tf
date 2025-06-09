terraform {
  backend "s3" {
    bucket         = "seb-terraform-state-bucket-name"
    key            = "voting-app/terraform.tfstate"
    region         = "us-west-2" # match the bucket
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}