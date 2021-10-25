resource "aws_subnet" "public_sub" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_sub_cidr
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "private_sub" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.private_sub_cidr
}

resource "aws_db_subnet_group" "vpc_subnets" {
  subnet_ids = [aws_subnet.public_sub.id, aws_subnet.private_sub.id]
}

resource "aws_elasticache_subnet_group" "ecash_sub_group" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [aws_subnet.public_sub.id, aws_subnet.private_sub.id]
}