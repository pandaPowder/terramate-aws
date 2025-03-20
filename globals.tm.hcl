#file: globals.tm.hcl

globals {
  aws_region   = "us-west-2"
  size_micro   = "t3.micro"
  size_small   = "t3.small"
  size_medium  = "t3.medium"
  size_large   = "t3.large"
  size_xlarge  = "t3.xlarge"
  size_2xlarge = "t3.2xlarge"
  size_4xlarge = "t3.4xlarge"
  tags = {
    Environment = "dev"
    Project     = "terramate-eks"
    Owner       = "Dallas"
    ManagedBy   = "terraform"
  }
}

