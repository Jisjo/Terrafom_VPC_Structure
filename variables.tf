variable "project" {
  default = "uno"
}
variable "region" {
  default = "ap-south-1"
  
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "public1_cidr" {
  default = "172.16.0.0/19"
}

variable "public1_az" {
  default = "ap-south-1a"
  
}


variable "public2_cidr" {
  default = "172.16.32.0/19"
}

variable "public2_az" {
  default = "ap-south-1b"
  
}



variable "public3_cidr" {
  default = "172.16.64.0/19"
}

variable "public3_az" {
  default = "ap-south-1c"
  
}


variable "private1_cidr" {
  default = "172.16.96.0/19"
}

variable "private1_az" {
  default = "ap-south-1a"
  
}

variable "private2_cidr" {
  default = "172.16.128.0/19"
}

variable "private2_az" {
  default = "ap-south-1b"
  
}


variable "private3_cidr" {
  default = "172.16.160.0/19"
}

variable "private3_az" {
  default = "ap-south-1b"
  
}


