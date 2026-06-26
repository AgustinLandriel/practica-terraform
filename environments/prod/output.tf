output "instance_private_ip" {

  value = module.ec2.instance_private_ip
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "private_subnets" {
  value = module.networking.private_subnets
}

output "public_subnets" {
  value = module.networking.public_subnets
}

output "sg_id" {
  value = module.networking.sg_id
}
