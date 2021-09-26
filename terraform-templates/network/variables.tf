variable "vpc_cidr" {
   description = "CIDR of the prod VPC"
   default = "10.0.0.0/16"   
}

variable "vpc_name" {
   description = "Name of the prod VPC"
   default = "vpc-aps1-eks"
}

variable "public_subnetaz1_cidr" {
   description = "CIDR of public subnet1"
   default = "10.0.1.0/24"  
}

variable "public_subnetaz1_name" {
   description = "NAme of public subnet1"
   default = "sub-aps1a-pub-01"
}

variable "public_subnetaz2_cidr" {
   description = "CIDR of public subnet2"
   default = "10.0.2.0/24"
}

variable "public_subnetaz2_name" {
   description = "NAme of public subnet2"
   default = "sub-aps1b-pub-02"
}

variable "private_subnetaz1_cidr" {
   description = "CIDR of private subnet1"
   default = "10.0.6.0/24"
}

variable "private_subnetaz1_name" {
   description = "NAme of private subnet1"
   default = "sub-aps1a-pri-01"
}

variable "private_subnetaz2_cidr" {
   description = "CIDR of private subnet2"
   default = "10.0.7.0/24"
}

variable "private_subnetaz2_name" {
   description = "NAme of private subnet2"
   default = "sub-aps1b-pri-02"
}

variable "prod_igw_name" {
   description = "NAme of the internet gateway"
   default = "igw-aps1-eks01"
}

variable "public_rt_name" {
   description = "NAme of the public subnets route table"
   default = "rt-aps1-pub-01"
}

variable "private_rt_name" {
   description = "NAme of the private subnets route table"
   default = "rt-aps1-pri-01"
}

variable "ekscp_sg_name" {
   description = "Name of the security group for EKS control plane"
   default = "terra_ekscontrolplane"
}

variable "rdsaccess_sg_name" {
   description = "Name of the security group for RDS"
    default = "terra_rdsaccess"
}
