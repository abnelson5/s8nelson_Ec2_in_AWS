variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Terraform-Ec2"
  type        = string
}

variable "subnet_id" {
  description = "subnet-0e76fe4891e838243"
  type        = string
}

variable "key_name" {
  description = "terraform"
  type        = string
}

variable "security_group_ids" {
  description = "sgr-0dec04068c77896fc sgr-00e7f64c905a8198f sgr-078639b9d60cf4044"
  type        = list(string)
  default     = []
}

variable "create_security_group" {
  description = "Whether to create a new security group"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to the instance"
  type        = map(string)
  default     = {}
}










































































