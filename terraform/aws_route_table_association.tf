
# Associate CRT and Subnet

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
  subnet_id      = aws_subnet.subnet_for_webservers.id
  route_table_id = aws_route_table.prod-public-crt.id
}