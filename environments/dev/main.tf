module "ec2" {
  source = "../../modules/ec2"

  service_names     = var.service_names
  instance_type     = "t3.micro"
  subnet_id         = module.networking.public_subnets[0]
  security_group_id = module.networking.sg_id
  environment       = var.environment
}
