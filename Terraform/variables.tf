variable "region" {
  description = "The aws region to deploy resources in"
  default     = "ap-south-1"
}
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0..0.0/16"
}
variable "subnet_cidr" {
  description = "The CIDR block for the subnet"
  default     = "10.0.1.0/24"
}
variable "instance_type" {
  description = "The EC2 Instance type"
  default     = "t2.micro"
}
variable "tags" {
  description = "A map of tags to add all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "ci-cd-pipeline"
  }
}
