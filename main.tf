module "instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "webserver-${var.env}"
  instance_count = 1

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.security_group.this_security_group_id]
  subnet_ids             = module.vpc.public_subnets
  iam_instance_profile   = module.role.iam_instance_profile_name
  user_data_base64       = base64encode(templatefile("${path.module}/files/script/user_data.sh", { nginx_conf = local.nginx_conf, webpage = local.webpage }))

  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}
