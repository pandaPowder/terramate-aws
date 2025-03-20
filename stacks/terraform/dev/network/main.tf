// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terramate-example-terraform-state-backend-speaktome"
    key    = "terraform/stacks/by-id/a10f10cb-3b7a-4447-a129-b8911d0e6de5/terraform.tfstate"
    region = "us-west-2"
  }
}
module "eks" {
  subnet_ids = data.terraform_remote_state.network.outputs.public_subnet_ids
  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
}
