# variables.tf

variable "ami_id" {
  description = "Ubuntu 24.04 AMI for ap-south-1 - verify current ID"
  type        = string
  default     = "ami-006f82a1d5a27da54" # Ubuntu 24.04 LTS
}

variable "instance_type" {
  type    = string
  default = "t2.xlarge"
}


variable "cluster_name" {
  type = string
  default = "eks-devsecops"
}

#variable "eks_cluster_arn" {
#  description = "ARN of the EKS cluster Jenkins needs to deploy to"
#  type        = string
#}