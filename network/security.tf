resource "aws_security_group" "pub_sec" {
  name        = "pub_sec"
  description = "public security group"
  vpc_id      = aws_vpc.myvpc.id

  ingress = [
    {
      description      = "ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  egress = [
    {
      description      = ""
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]
}

resource "aws_security_group" "priv_sec" {
  name        = "priv_sec"
  description = "private security group"
  vpc_id      = aws_vpc.myvpc.id

  ingress = [
    {
      description      = "ssh"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.myvpc.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  egress = [
    {
      description      = ""
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]
}