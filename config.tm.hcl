globals "terraform" {
  version = "1.11.0"
}

globals "terraform" "backend" {
  bucket  = "terramate-example-terraform-state-backend-speaktome"
  region  = "us-west-2"
  profile = "workloads"
}

globals "aws" "oidc" {
  github_repositories = [
    "terramate-io/terramate-quickstart-aws",
    "pandaPowder/terramate-aws",
    # "another-org/another-repo:ref:refs/heads/main",
  ]
}

globals "terraform" "providers" "aws" {
  enabled = true
  source  = "hashicorp/aws"
  version = "~> 5.89"
  config = {
    region = "us-east-1"
  }
}
