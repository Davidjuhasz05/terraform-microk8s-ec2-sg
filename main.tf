data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

locals {
  deployment_yaml = file("${path.module}/k8s/nginx-deployment.yaml")
  namespace_yaml  = file("${path.module}/k8s/namespace.yaml")
}

resource "aws_instance" "vm" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.vm_sg.id]

  key_name = var.key_name

  user_data = templatefile("${path.module}/user-data.sh", {
    deployment_yaml = local.deployment_yaml
    namespace_yaml  = local.namespace_yaml
  })

  tags = merge(var.tags, { "Name" = "tf-mk8s-vm" })
}

resource "aws_security_group" "vm_sg" {
  name        = "tf-mk8s-vm-sg"
  description = "Allow SSH from configured CIDR and HTTP from anywhere"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { "Name" = "tf-mk8s-vm-sg" })
}

# Optional key pair creation if user provides a public key path
resource "aws_key_pair" "default" {
  count      = var.create_key_pair ? 1 : 0
  key_name   = var.key_name
  public_key = var.public_key
}