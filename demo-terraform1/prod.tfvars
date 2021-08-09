ami_id        = "ami-036af88fae0aa0c6e"
instance_type = "t2.large"
tags          = { Name = "juancsr-terraform1", Environment = "Prod" }
sg_name       = "juancsr-rules"
ingress_rules = [
  {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]