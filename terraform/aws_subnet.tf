#cidr_block: 10.0.1.0/24. We have 254 IP addresses in this subnet
resource "aws_subnet" "subnet_for_webservers" {
  vpc_id                  = aws_vpc.vpc_main.id
  cidr_block              = "10.0.1.0/16"
  map_public_ip_on_launch = true //it makes this a public subnet
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Subnet for Webservers"
  }
}