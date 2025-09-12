# Load Balancer SG: Public internet access
resource "aws_security_group" "lb_sg" {
  name        = "${var.project_name}-${var.environment}-lb-sg"
  description = "Allows HTTP/HTTPS from public"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-lb-sg"
    Environment = var.environment
  }
}

# Application SG: Only accessible from LB SG
resource "aws_security_group" "app_sg" {
  name        = "${var.project_name}-${var.environment}-app-sg"
  description = "Allows app access only from LB SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow from Load Balancer SG"
    from_port       = var.app_port
    to_port         = var.app_port
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-app-sg"
    Environment = var.environment
  }
}

# Database SG: Only accessible from App SG
resource "aws_security_group" "db_sg" {
  name        = "${var.project_name}-${var.environment}-db-sg"
  description = "Allows DB access only from App SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow from Application SG"
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-sg"
    Environment = var.environment
  }
}
