variable "vpc_name" {
  description = "Existing VPC name"
  type        = string
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type        = string
}

variable "private_subnet_name" {
  description = "Private subnet name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

