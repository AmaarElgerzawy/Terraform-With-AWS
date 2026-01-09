variable "region" {
  default = "us-east-1"
}

variable "s3_name" {
  default = "ammar-terraform-bucket"
}

variable "vpc_name" {
  default = "ammar-vpc"
}

variable "vpc_cidr" {
  default = "172.21.0.0/16"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "zone2" {
  default = "us-east-1b"
}

variable "zone3" {
  default = "us-east-1c"
}

variable "pubsub1cidr" {
  default = "172.21.1.0/24"
}
variable "pubsub2cidr" {
  default = "172.21.2.0/24"
}
variable "pubsub3cidr" {
  default = "172.21.3.0/24"
}

variable "privsub1cidr" { default = "172.21.11.0/24" }
variable "privsub2cidr" { default = "172.21.12.0/24" }
variable "privsub3cidr" { default = "172.21.13.0/24" }


variable "AMI_ID" {
  default = "ami-07ff62358b87c7116"
}