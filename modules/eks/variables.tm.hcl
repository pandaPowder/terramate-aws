generate_hcl "variables.tf" {
  content {
    variable "vpc_id" {
      description = "VPC ID where EKS cluster will be created"
      type        = string
      default     = data.terraform_remote_state.network.outputs.vpc_id
    }

    variable "subnet_ids" {
      description = "List of subnet IDs for EKS cluster"
      type        = list(string)
      default     = data.terraform_remote_state.network.outputs.subnet_ids
    }
  }
} 