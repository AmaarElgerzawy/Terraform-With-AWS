resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow 80 access from within VPC"

  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ec2_security_group"
  }
}

resource "aws_instance" "my_ec2" {
  ami             = var.AMI_ID
  instance_type   = "t2.medium"
  security_groups = [aws_security_group.ec2_sg.id]

  subnet_id = module.vpc.public_subnets[0]
  key_name  = "Udemy_10_DevOps_Projects_Automate_Deploy_and_Scale_with_Kubernete"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    EOF
  tags = {
    Name = "My_EC2_Instance"
  }
}