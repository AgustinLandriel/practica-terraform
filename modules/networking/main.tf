module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-${var.environment}"
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.public_subnets
  public_subnets  = var.private_subnets

  enable_nat_gateway   = false
  enable_vpn_gateway   = false
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}


module "sg" {
  source      = "terraform-aws-modules/security-group/aws"
  name        = "http-rule-${var.environment}"
  description = " security group ${var.environment}"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = {
    https = {
      from_port   = 443
      ip_protocol = "tcp"
      cidr_ipv4   = var.cidr
      description = "HTTPS from internal"
    }
  }

  egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }

  tags = {
    Environment = var.environment
  }
}
