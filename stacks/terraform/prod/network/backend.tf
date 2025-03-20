// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terramate-example-terraform-state-backend-speaktome"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    key            = "terraform/stacks/by-id/a62efd8c-3b5a-4128-b1a4-dbe0c07da5a8/terraform.tfstate"
    region         = "us-west-2"
  }
}
