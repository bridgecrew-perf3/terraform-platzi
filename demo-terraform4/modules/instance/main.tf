# provider "{name}"
provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "ssh_connection" {
  name        = var.sg_name
  description = "Allow ssh inbound traffic"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = "allow_ssh"
  }
}

# resource "{type}" "{identifier}"
resource "aws_instance" "juancsr-instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  tags            = var.tags
  key_name        = "personal-ec2-access-key-us-east-2"
  security_groups = [aws_security_group.ssh_connection.name]
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "centos"
      private_key = file(var.private_key)
      host = self.public_ip
    }
    # comandos o lista de comandos
    inline = ["echo starting container...","docker run -it -d -p 80:80 juancsr/hello-world:latest"]
  }
}