// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

variable "vpc_id" {
  description = "VPC ID where EKS cluster will be created"
  type        = string
}
variable "subnet_ids" {
  description = "List of subnet IDs for EKS cluster"
  type        = list(string)
}
