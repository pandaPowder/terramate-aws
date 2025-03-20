// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "aws_availability_zones" "available" {
  names = [
    "us-west-2a",
    "us-west-2b",
  ]
}
resource "aws_vpc" "main" {
  cidr_block = "20.0.0.0/16"
  id         = "dev-vpc-eks"
  tags = merge({
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "Dallas"
    Project     = "terramate-eks"
    }, {
    Name = "MyNetworking-vpc-eks"
  })
}
resource "aws_subnet" "public_subnet" {
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  count                   = 2
  map_public_ip_on_launch = true
  tags = merge({
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "Dallas"
    Project     = "terramate-eks"
    }, {
    Name = "public-subnet-${count.index}"
  })
  vpc_id = aws_vpc.main.id
}
resource "aws_internet_gateway" "main" {
  tags = merge({
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "Dallas"
    Project     = "terramate-eks"
    }, {
    Name = "main-igw"
  })
  vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "public" {
  tags = merge({
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "Dallas"
    Project     = "terramate-eks"
    }, {
    Name = "main-route-table"
  })
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}
resource "aws_route_table_association" "a" {
  count          = 2
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnet[*].id[count.index]
}
