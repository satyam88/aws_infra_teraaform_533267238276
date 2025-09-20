variable "vpc_name" {
  description = "Existing VPC name"
  type        = string
  default     = "radical-dev-network"
}

variable "public_subnet_name" {
  description = "Public subnet name"
  type        = string
  default     = "rdn-public-subnet"
}

variable "private_subnet_name" {
  description = "Private subnet name"
  type        = string
  default     = "rdn-private-subnet"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

