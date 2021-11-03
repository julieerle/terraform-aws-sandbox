locals {
  owner = "julie.erlemeier@hashicorp.com"
  team  = "terraform-cli-support"

  common_tags = {
    owner = local.owner
    team  = local.team
  }
}

variable "aws_region" {
  description = "Infra will be provisioned in this AWS region (Oregon)."
  type        = string
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "Manually created example VPC for testing."
  type        = string
  default     = "vpc-012b2515199ccd7a8"
}

variable "subnet_id" {
  description = "Public subnet for example-vpc in us-west-2b with IPv4 CIDR 10.0.102.0/24"
  type        = string
  default     = "subnet-062b85c42832e807c"
}

variable "instance_type" {
  description = "List of instance types for EC2."
  type        = list(string)
  default     = ["t2.micro", "t3.micro"]
}
