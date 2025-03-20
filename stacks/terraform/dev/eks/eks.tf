// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "eks" {
  cluster_endpoint_public_access = true
  cluster_name                   = "dev-eks"
  cluster_version                = "1.31"
  eks_managed_node_groups = {
    dallas = {
      desired_size = 2
      instance_types = [
        "t3.medium",
      ]
      max_size = 3
      min_size = 1
    }
  }
  enable_cluster_creator_admin_permissions = true
  source                                   = "terraform-aws-modules/eks/aws"
  subnet_ids                               = [for subnet in aws_subnet.public_subnet : subnet.id][count.index]
  tags = merge({
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "Dallas"
    Project     = "terramate-eks"
    }, {
    Environment = "dev"
    Terraform   = "true"
  })
  version = "~> 20.31"
  vpc_id  = aws_vpc.main.id
}
