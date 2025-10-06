#NAT
resource "aws_eip" "nat" {
  tags = {
    Name = "eip-${var.vpc_name}-${var.env}"
  }
}

# NAT Association to Subnet - Create NAT Gateway in the public subnet
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "nat-${var.vpc_name}-${var.env}"
  }
}

# Create Route Table for private subnets to use NAT
resource "aws_route_table" "ngw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "rtb-nat-${var.vpc_name}-${var.env}"
  }
}

# Add default route via NAT Gateway
resource "aws_route" "ngw" {
  route_table_id         = aws_route_table.ngw.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}
