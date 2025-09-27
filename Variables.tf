variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "availability_zone_1" {
  description = "First availability zone"
  type        = string
}

variable "subnet_1_cidr_block" {
  description = "CIDR block for subnet 1"
  type        = string
}

variable "route_cidr" {
  description = "CIDR block for route"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

