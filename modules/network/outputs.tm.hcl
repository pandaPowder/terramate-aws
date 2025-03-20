generate_hcl "outputs.tf" {
  content {
    output "vpc_id" {
      description = "The ID of the VPC"
      value       = aws_vpc.main.id
    }

    output "vpc_cidr" {
      description = "The CIDR block of the VPC"
      value       = aws_vpc.main.cidr_block
    }

    output "public_subnet_ids" {
      description = "List of public subnet IDs"
      value       = [for subnet in aws_subnet.public_subnet : subnet.id]
    }

    output "public_subnet_cidrs" {
      description = "List of public subnet CIDR blocks"
      value       = [for subnet in aws_subnet.public_subnet : subnet.cidr_block]
    }

    output "public_subnet_availability_zones" {
      description = "List of public subnet availability zones"
      value       = [for subnet in aws_subnet.public_subnet : subnet.availability_zone]
    }
  }
} 