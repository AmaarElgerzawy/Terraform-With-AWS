module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs = [var.zone1, var.zone2, var.zone3]

  # Public subnets → NAT lives here
  public_subnets = [
    var.pubsub1cidr,
    var.pubsub2cidr,
    var.pubsub3cidr
  ]

  # Private subnets → EC2 lives here
  private_subnets = [
    var.privsub1cidr,
    var.privsub2cidr,
    var.privsub3cidr
  ]

  enable_nat_gateway = true
  single_nat_gateway = true

  map_public_ip_on_launch = false

  enable_dns_support   = true
  enable_dns_hostnames = true
}
