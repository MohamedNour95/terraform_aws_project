resource "aws_subnet" "public_sub" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_sub_cidr
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "private_sub" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_sub_cidr
}