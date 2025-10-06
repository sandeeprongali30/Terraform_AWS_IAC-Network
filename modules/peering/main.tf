resource "aws_vpc_peering_connection" "owner" {
  vpc_id      = var.infra_vpc_id
  peer_vpc_id = aws_vpc.terra_vpc.id
  auto_accept = true
  accepter {
    allow_remote_vpc_dns_resolution = true
  }
  requester {
    allow_remote_vpc_dns_resolution = true
  }
}
resource "aws_route" "owner1" {
  count                     = length(var.infra_route_table_ids)
  route_table_id            = element(var.infra_route_table_ids, count.index)
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
}

resource "aws_route" "accepter1" {
  route_table_id            = aws_route_table.public_rt.id
  destination_cidr_block    = var.infra_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
}
resource "aws_route" "accepter2" {
  route_table_id            = aws_route_table.ngw.id
  destination_cidr_block    = var.infra_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.owner.id
}
