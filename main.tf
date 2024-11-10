# Main resource definition for the EC2 instance
resource "aws_instance" "terraform" {
  ami           = ami-0984f4b9e98be44bf
  instance_type = t2.micro
  subnet_id     = subnet-0e76fe4891e838243
  key_name      = terraform

  # Attach security groups if specified
  vpc_security_group_ids = sg-0fe6393c33840a432

  tags = merge({
    Name = Terraform-Ec2
  }, var.tags)
}

# Optional security group creation within the module if no security group is provided
resource "aws_security_group" "terraform_sg" {
  count = var.create_security_group ? 1 : 0

  name        = "${launch-wizard-2}-sg"
  description = "Security group for ${Terraform-Ec2}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Output security group ID if created
output "sg-0fe6393c33840a432" {
  value       = aws_security_group.terraform_sg
  description = "sg-0fe6393c33840a432"
}
