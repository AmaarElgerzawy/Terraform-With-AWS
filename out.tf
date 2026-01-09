output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "ec2_instance_id" {
  value = aws_instance.my_ec2.id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "load_balancer_dns_name" {
  value = aws_lb.my_lb.dns_name
}