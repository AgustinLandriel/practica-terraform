resource "aws_instance" "example" {
  for_each = var.service_name

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.terraform-sg.id]

  tags = {
    ExtraTag    = local.extra_tag
    Name        = "EC2-${each.key}-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_cloudwatch_log_group" "ec2_log_group" {

  for_each = var.service_name

  tags = {
    Environment = var.environment
    Name        = "EC2-LogGroup-${each.key}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
