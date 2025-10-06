output "public_rt_id" {
  description = "The ID of the public route table."
  value       = aws_route_table.public_rt.id
}
