#IGW - Internet Gateway
resource "aws_internet_gateway" "terra_igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.vpc_name}-IGW"
    Env  = var.env
  }
}

# Public Route table: Attached Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terra_igw.id
  }
  tags = {
    Name = "${var.vpc_name}-publicRouteTable"
    Env  = var.env
  }
}
