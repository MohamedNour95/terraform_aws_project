data "aws_ami" "ubuntu1" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "bastion" {
  ami             = data.aws_ami.ubuntu1.id
  instance_type   = "t2.micro"
  security_groups = [module.network.pub_sec_id]
  subnet_id       = module.network.subnet_public_id
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }
}

data "aws_ami" "ubuntu2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "application" {
  ami             = data.aws_ami.ubuntu2.id
  instance_type   = "t2.micro"
  security_groups = [module.network.priv_sec_id]
  subnet_id       = module.network.subnet_private_id
}