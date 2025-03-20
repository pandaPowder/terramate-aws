generate_hcl "eks.tf" {
  stack_filter {
    project_paths = [
      "/stacks/**/eks", # match exact path
    ]
  }
  content {
    module "eks" {
      source  = "terraform-aws-modules/eks/aws"
      version = "~> 20.31"

      cluster_name    = "${global.environment.environment}-eks"
      cluster_version = "1.31"

      # Optional
      cluster_endpoint_public_access = true

      # Optional: Adds the current caller identity as an administrator via cluster access entry
      enable_cluster_creator_admin_permissions = true

      eks_managed_node_groups = {
        dallas = {
          instance_types = ["t3.medium"]
          min_size       = 1
          max_size       = 3
          desired_size   = 2
        }
      }

      vpc_id     = aws_vpc.main.id
      subnet_ids = aws_subnet.public_subnet.*.id
      tags = merge(global.tags, {
        Environment = global.environment.environment
        Terraform   = "true"
      })
    }
  }
}
