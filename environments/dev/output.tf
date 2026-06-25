output "instance_ip" {
  #value = aws_instance.example[each.key].private_ip

  value = { for service, instance in aws_instance.example : service => instance.private_ip }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}