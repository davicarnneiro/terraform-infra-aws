module "role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "4.2.0"

  trusted_role_services = [
    "ec2.amazonaws.com"
  ]

  create_role             = true
  create_instance_profile = true

  role_name         = "webserver-${var.env}"
  role_requires_mfa = false

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
  ]
}