#create VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = var.vpc_tags
}

# Create public subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  count  = length(var.pub_ciders)
  #count = var.subnet_count
  cidr_block        = var.pub_ciders[count.index]
  availability_zone = data.aws_availability_zones.az.names[count.index]
  tags = {
    Name = "Public-${count.index + 1}"
  }
}
# Create private subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.main.id
  count  = length(var.priv_ciders)
  #count = var.subnet_count
  cidr_block        = var.priv_ciders[count.index]
  availability_zone = local.azs[count.index]
  tags = {
    Name = "Private-${count.index + 1}"
  }
}

# Create DB subnet
resource "aws_subnet" "db" {
  vpc_id = aws_vpc.main.id
  count  = length(var.db_ciders)
  #count = var.subnet_count
  cidr_block        = var.db_ciders[count.index]
  availability_zone = local.azs[count.index]
  tags = {
    Name = "db-${count.index + 1}"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [for subnet in aws_subnet.db : subnet.id]

  tags = {
    Name = "My DB subnet group"
  }
}

# output "availability_zone_names" {    
#   value = aws_vpc.main.cidr_block
# }

#   pub_sub_ids =aws_subnet.public.*.id
#  # priv_sub_ids =aws_subnet.private.*.id
#   azs = data.aws_availability_zones.az.names

# Create IGW
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# Create Route Table 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  # Attach route table with IGW
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  # route {
  #   ipv6_cidr_block        = "::/0"
  #   egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  # }

  tags = {
    Name = "public-route-table"
  }
}

# Associate route-Table with public subnet
resource "aws_route_table_association" "public" {
  count          = length(var.pub_ciders)
  subnet_id      = aws_subnet.public.*.id[count.index]
  route_table_id = aws_route_table.public.id
}
