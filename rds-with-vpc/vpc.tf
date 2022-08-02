data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"

  name            = "rds-vpc-${var.sandbox_id}"
  cidr            = "10.0.0.0/16"
  azs             = data.aws_availability_zones.available.names
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  # enable_nat_gateway   = true
  # single_nat_gateway   = true
  # enable_dns_hostnames = true

  # Public access to RDS instances
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  # single_nat_gateway = true # needed for fargate (https://docs.aws.amazon.com/eks/latest/userguide/eks-ug.pdf#page=135&zoom=100,96,764)
  # enable_nat_gateway = true # needed for fargate (https://docs.aws.amazon.com/eks/latest/userguide/eks-ug.pdf#page=135&zoom=100,96,764)
  enable_vpn_gateway   = false
  
  # tags = {
  # }

  public_subnet_tags = {
    "role" = "db"
  }
}