// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terramate-example-terraform-state-backend-speaktome"
    key    = "terraform/stacks/by-id/7d22b8e6-0e02-4815-995b-1cd34c826c95/terraform.tfstate"
    region = "us-west-2"
  }
}
module "eks" {
  subnet_ids = data.terraform_remote_state.network.outputs.public_subnet_ids
  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
}
