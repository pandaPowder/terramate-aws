// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terramate-example-terraform-state-backend-speaktome"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    key            = "terraform/stacks/by-id/a10f10cb-3b7a-4447-a129-b8911d0e6de5/terraform.tfstate"
    region         = "us-west-2"
  }
}
