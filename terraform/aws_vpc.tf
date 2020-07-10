
#cidr_block: 10.0.0.0/16 allows you to use the IP address that start with “10.0.X.X”. There are 65,536 IP addresses are ready to use.

resource "aws_vpc" "vpc_main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true #gives you an internal domain name
  enable_dns_hostnames = true #gives you an internal host name
  enable_classiclink   = false
  instance_tenancy     = "default"
}
