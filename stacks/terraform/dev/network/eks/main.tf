// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terramate-example-terraform-state-backend-speaktome"
    key    = "terraform/stacks/by-id/779d8a8a-7e14-4701-9584-a80bf448905b/terraform.tfstate"
    region = "us-west-2"
  }
}
module "eks" {
  subnet_ids = data.terraform_remote_state.network.outputs.public_subnet_ids
  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
}
