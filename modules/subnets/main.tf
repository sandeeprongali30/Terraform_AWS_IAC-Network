# Subnets : public
resource "aws_subnet" "public" {
  count             = length(var.public_subnets_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_subnets_cidr, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${element(var.public_subnets_name, count.index + 1)}-${var.vpc_name}"
  }
}
# Subnets : private
resource "aws_subnet" "private" {
  count             = length(var.private_subnets_cidr)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.private_subnets_cidr, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "${element(var.private_subnets_name, count.index + 1)}-${var.vpc_name}"
  }
}


# Route table association with public subnets
resource "aws_route_table_association" "a" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = var.public_rt_id
}

# Route table association with private subnets
resource "aws_route_table_association" "b" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = var.private_rt_id
}
