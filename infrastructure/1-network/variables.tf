variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default = "eks-devsecops"
}

variable "admin_cidr" {
  description = "IP for SSH/Jenkins UI access"
  type        = string
  default = "0.0.0.0/0"
}
