# Determine subnet to use
locals {
  subnet_id = var.subnet_id != "" ? var.subnet_id : element(var.private_subnet_ids, 0)
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = local.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = var.associate_public_ip
  key_name                    = var.key_name != "" ? var.key_name : null
  user_data                   = var.user_data

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
    encrypted   = true
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-ec2"
    Project     = var.project_name
    Environment = var.environment
  }
}
