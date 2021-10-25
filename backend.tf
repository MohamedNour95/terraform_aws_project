terraform {
  backend "s3" {
    bucket = "terraform-sprints-task"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}