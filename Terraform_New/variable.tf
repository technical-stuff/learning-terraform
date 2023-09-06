#VPC
variable "clops-vpc_ip" {}

#Public_subnet
variable "public_subnet_cidr" {}

#Private_subnet
variable "private_subnet_cidr" {}

#availability_zone
variable "availability_zone_name" {}

#public_route_table_CIDR
variable "public_rt" {}

#public_route_table_CIDR
variable "private_rt" {}

#Instance_type
variable "instance_type" {}

#Instance_count
variable "instance_count" {}

#ami_id
variable "ami_id" {}

#sg_port
variable "applicationserver_port" {}

#variable "private_subnet_output" {}

variable "vpc_output" {}

variable "clops_private_subnet" {}
