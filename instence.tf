resource "aws_security_group" "ec2_sg" {
  name        = "ec2_security_group"
  description = "Allow 80 access from within VPC"

  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
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
  ami           = var.AMI_ID
  instance_type = "t2.medium"

  subnet_id = module.vpc.private_subnets[0]

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  associate_public_ip_address = false  # NO public IP

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
  EOF

  tags = {
    Name = "Private_EC2_With_NAT"
  }
}
