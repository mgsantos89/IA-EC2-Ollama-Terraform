module "key_pair" {
  source   = "./modules/key_pair"
  key_name = var.key_name
}


module "security_group" {
  source              = "./modules/security_group"
  security_group_name = "ec2-gpu-sg"
  vpc_id              = var.vpc_id
}



module "ec2_gpu" {
  source            = "./modules/ec2"
  instance_type     = var.instance_type
  key_name          = module.key_pair.key_name
  subnet_id         = var.subnet_id
  security_group_ids = [module.security_group.security_group_id]
  volume_size       = var.volume_size
  instance_name     = var.instance_name
}
