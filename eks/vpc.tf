data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"

  name            = var.cluster_name
  cidr            = "10.0.0.0/16"
  azs             = data.aws_availability_zones.available.names
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  # enable_nat_gateway   = true
  # single_nat_gateway   = true
  # enable_dns_hostnames = true

  # single_nat_gateway = true # needed for fargate (https://docs.aws.amazon.com/eks/latest/userguide/eks-ug.pdf#page=135&zoom=100,96,764)
  # enable_nat_gateway = true # needed for fargate (https://docs.aws.amazon.com/eks/latest/userguide/eks-ug.pdf#page=135&zoom=100,96,764)
  enable_vpn_gateway   = false
  enable_dns_hostnames = true # needed for fargate (https://docs.aws.amazon.com/eks/latest/userguide/eks-ug.pdf#page=135&zoom=100,96,764)
  enable_dns_support   = true # needed for fargate (https://docs.aws.amazon.com/eks/latest/userguide/eks-ug.pdf#page=135&zoom=100,96,764)


  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}