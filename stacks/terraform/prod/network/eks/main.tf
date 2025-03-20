// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terramate-example-terraform-state-backend-speaktome"
    key    = "terraform/stacks/by-id/f0d685f8-20c3-418d-a8d5-dd1e87548a4a/terraform.tfstate"
    region = "us-west-2"
  }
}
module "eks" {
  subnet_ids = data.terraform_remote_state.network.outputs.public_subnet_ids
  vpc_id     = data.terraform_remote_state.network.outputs.vpc_id
}
