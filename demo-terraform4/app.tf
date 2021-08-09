# provider "{name}"
provider "aws" {
  region = "us-east-2"
}


# Llamar el modulo que se quiere utilizar
module "app-juancsr" {
  # local module
  source = "./modules/instance"
  # remote module
  # source = "github.com/juancsr/terraform-platzi/demo-terraform3/modules/instance"
  # variables de los resources
  ami_id        = var.ami_id
  instance_type = var.instance_type
  tags          = var.tags
  sg_name       = var.sg_name
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
  private_key   = var.private_key
}