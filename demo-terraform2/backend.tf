terraform {
  backend "s3" {
    bucket = "backend-terraform-juancsr"
    key    = "dev"
    region = "us-east-2"
    force_destro = true
  }
}
