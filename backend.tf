
terraform {
  backend "s3" {
    bucket = "young-minds-jenkins-server-terrform-batch-29"
    region = "ap-south-1"
    key = "eks/terraform.tfstate"
  }
}
    