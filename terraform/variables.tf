variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "key_name" {
  description = "Name of the existing AWS Key Pair to SSH into EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "frontend_port" {
  description = "Port number that the frontend service listens on"
  type        = number
  default     = 80
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
  default     = "voting-app-alb"
}

variable "my_ip_cidr" {
  description = "Your public IP address in CIDR notation to allow SSH access (e.g. 203.0.113.5/32)"
  type        = string
  # You can set default to empty and override with -var, or leave it blank to be fetched dynamically later
  default     = ""
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed"
  type        = string
}
