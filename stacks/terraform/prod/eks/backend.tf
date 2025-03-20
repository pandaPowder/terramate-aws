// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terramate-example-terraform-state-backend-speaktome"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    key            = "terraform/stacks/by-id/f0d685f8-20c3-418d-a8d5-dd1e87548a4a/terraform.tfstate"
    region         = "us-west-2"
  }
}
