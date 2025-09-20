data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Fetch existing public subnet
data "aws_subnet" "public" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
  vpc_id = data.aws_vpc.selected.id
}

# Fetch existing private subnet
data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
  vpc_id = data.aws_vpc.selected.id
}

data "aws_ami" "amazon_linux_2025" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # 👈 ensure Intel/AMD AMI
  }

  owners = ["137112412989"]
}

# Public EC2 instance
resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.amazon_linux_2025.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.public.id
  count         = "2"
  tags = {
    Name = "public-instance"
    env  = "prod"
  }
}

# Private EC2 instance
resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.amazon_linux_2025.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.private.id
  count         = "2"
  tags = {
    Name = "private-instance"
    env  = "prod"
  }
}
