terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-01"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}