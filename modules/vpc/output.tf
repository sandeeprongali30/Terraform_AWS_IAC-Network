output "vpcid" {
  value = aws_vpc.terra_vpc.id
}


output "public_rt_id" {
  value = aws_route_table.public.id
}

output "private_rt_id" {
  value = aws_route_table.private.id
}
