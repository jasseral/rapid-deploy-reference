
#Create a custom route table for public subnet. public subnet can reach to the internet by using this.

resource "aws_route_table" "prod-public-crt" {
  vpc_id = aws_vpc.vpc_main.id
  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0" //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.gw.id
  }

}