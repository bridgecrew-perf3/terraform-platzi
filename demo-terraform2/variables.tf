variable "bucket_name" {
  default = "backend-terraform-juancsr"
}

variable "acl" {
  default = "private"
}

variable "tags" {
  default = {
    Name        = "terraform-backend"
    Environment = "Dev"
    CreatedBy   = "terraform"
  }
}