module "subnet" {
  source = "./modules/subnet"

  vpc_id      = aws_vpc.imported_vpc.id
  cidr_blocks = ["10.0.1.0/24"]
  azs         = ["eu-north-1a"]
  tags        = local.common_tags
}

module "ec2" {
  source = "./modules/ec2"

  subnet_ids        = module.subnet.subnet_ids
  instance_type     = local.instance_type
  instance_count    = local.instance_count
  security_group_id = aws_security_group.web_sg.id
  tags              = local.common_tags

  key_name          = "terraform.key"
  private_key_path  = "/tmp/terraform.key"
}
