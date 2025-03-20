// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terramate-example-terraform-state-backend-speaktome"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    key            = "terraform/stacks/by-id/779d8a8a-7e14-4701-9584-a80bf448905b/terraform.tfstate"
    region         = "us-west-2"
  }
}
