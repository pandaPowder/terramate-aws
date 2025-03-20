generate_hcl "network.tf" {
  stack_filter {
    project_paths = [
      "/stacks/**/network", # match exact path
    ]
  }
  content {
    data "aws_availability_zones" "available" {}

    resource "aws_vpc" "main" {
      cidr_block = tm_try(global.networking.cidr, "10.0.0.0/16")
      id         = "${global.environment.environment}-vpc-eks"
      tags = merge(global.tags, {
        Name = "${terramate.stack.name}-vpc-eks"
      })
    }

    resource "aws_subnet" "public_subnet" {
      count                   = 2
      vpc_id                  = aws_vpc.main.id
      cidr_block              = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
      availability_zone       = data.aws_availability_zones.available.names[count.index]
      map_public_ip_on_launch = true

      tags = merge(global.tags, {
        Name = "public-subnet-${count.index}"
      })
    }

    resource "aws_internet_gateway" "main" {
      vpc_id = aws_vpc.main.id

      tags = merge(global.tags, {
        Name = "main-igw"
      })
    }

    resource "aws_route_table" "public" {
      vpc_id = aws_vpc.main.id

      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
      }

      tags = merge(global.tags, {
        Name = "main-route-table"
      })
    }

    resource "aws_route_table_association" "a" {
      count          = 2
      subnet_id      = aws_subnet.public_subnet.*.id[count.index]
      route_table_id = aws_route_table.public.id
    }

  }
}