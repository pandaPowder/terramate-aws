generate_hcl "main.tf" {
  content {
    data "terraform_remote_state" "network" {
      backend = "s3"
      config = {
        region = global.terraform.backend.region
        bucket = global.terraform.backend.bucket
        key    = tm_try(global.terraform.backend.key, "terraform/stacks/by-id/${terramate.stack.id}/terraform.tfstate")
      }
    }


    module "eks" {
      vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
      subnet_ids = data.terraform_remote_state.network.outputs.public_subnet_ids
    }
  }
} 