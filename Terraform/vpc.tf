#this file will define the VPC and networking resources
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = merge(var.tags, { Name = "VPC" })
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  tags       = merge(var.tags, { Name = "Main Subnet" })
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = merge(var.tags, { Name : "Main Internet Gateway" })
}
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = merge(var.tags, { Name : "Main Route Table" })
}
