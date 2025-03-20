stack {
  name        = "Dev EKS"
  description = "EKS for dev"
  id          = "779d8a8a-7e14-4701-9584-a80bf448905b"
}

globals "environment" {
  environment = "dev"
}

globals "eks" {
  instance_type = "t3.micro"
}
