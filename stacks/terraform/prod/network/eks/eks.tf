// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terramate-example-terraform-state-backend-speaktome"
    key    = "terraform/stacks/by-id/f0d685f8-20c3-418d-a8d5-dd1e87548a4a/terraform.tfstate"
    region = "us-west-2"
  }
}
variable "vpc_id" {
  value = data.terraform_remote_state.network.outputs.vpc_id
}
variable "subnet_ids" {
  value = data.terraform_remote_state.network.outputs.subnet_ids
}
module "eks" {
  cluster_endpoint_public_access = true
  cluster_name                   = "prod-eks"
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
  subnet_ids                               = data.terraform_remote_state.network.outputs.subnet_ids
  tags = merge({
    Environment = "dev"
    ManagedBy   = "terraform"
    Owner       = "Dallas"
    Project     = "terramate-eks"
    }, {
    Environment = "prod"
    Terraform   = "true"
  })
  version = "~> 20.31"
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
}
