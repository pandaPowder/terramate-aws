stack {
  name        = "MyNetworking"
  description = "Base networking in support of my environment"
  id          = "a10f10cb-3b7a-4447-a129-b8911d0e6de5"
}

globals "networking" {
  cidr = "20.0.0.0/16"
}

globals "environment" {
  environment = "dev"
}