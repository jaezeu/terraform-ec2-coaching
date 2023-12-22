module "ec2" {
  source = "../../modules/ec2-instance"

  ec2_count      = 2
  prefix         = "jaz-nonprd"
  enable_ssh_key = true
}