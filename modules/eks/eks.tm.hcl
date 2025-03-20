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
          instance_types = [global.eks.instance_type]
          min_size       = 1
          max_size       = 3
          desired_size   = 2
        }
      }

      vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
      subnet_ids = data.terraform_remote_state.network.outputs.subnet_ids
      tags = merge(global.tags, {
        Environment = global.environment.environment
        Terraform   = "true"
      })
    }
  }
}
