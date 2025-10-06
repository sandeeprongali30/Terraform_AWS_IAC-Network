output "PublicSubnet-1" {
  value = aws_subnet.public[0].id
}
output "PublicSubnet-2" {
  value = aws_subnet.public[1].id
}

output "PrivateSubnet-1" {
  value = aws_subnet.private[0].id
}
output "PrivateSubnet-2" {
  value = aws_subnet.private[1].id
}
output "PrivateSubnet-3" {
  value = aws_subnet.private[2].id
}
output "PrivateSubnet-4" {
  value = aws_subnet.private[3].id
}
