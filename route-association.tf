resource "aws_route_table_association" "public_assoc" {
  subnet_id      = module.subnet.subnet_ids[0]
  route_table_id = aws_route_table.public_rt.id
}
