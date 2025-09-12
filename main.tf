module "vpc" {
  source       = "./modules/vpc"
  aws_region   = var.aws_region
  project_name = var.project_name
  environment  = var.environment
}

module "security_group" {
  source       = "./modules/security-group"
  vpc_id       = module.vpc.vpc_id
  project_name = var.project_name
  environment  = var.environment

  # Optional port overrides
  app_port = 80
  db_port  = 3306
}

module "ec2_app" {
  source              = "./modules/ec2"
  #ami_id              = var.ami_id
  instance_type       = "t3.micro"
  private_subnet_ids  = module.vpc.private_subnet_ids
  security_group_id   = module.security_group.application_sg_id
  key_name            = "key" ##Manually crate it in AWS console
  associate_public_ip = false
  project_name        = var.project_name
  environment         = var.environment
}

module "loadbalancer" {
  source             = "./modules/loadbalancer"
  project_name       = var.project_name
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  security_group_id  = module.security_group.load_balancer_sg_id
  instance_ids       = [module.ec2_app.instance_id]
  target_port        = 80
  health_check_path  = "/"
}
