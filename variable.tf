#VPC
variable "clops-vpc_ip" {
  default     = "10.0.0.0/16"
}

#Public_subnet
variable "public_subnet_cidr" {
    type = list(string)
    description = "Public subnet CIDR"
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

#Private_subnet
variable "private_subnet_cidr" {
    type = list(string)
    description = "Private subnet CIDR"
    default = ["10.0.3.0/24", "10.0.4.0/24"]
}

#availability_zone
variable "availability_zone_name" {
    type = list(string)
    description = "availability_zone_name for subnet"
    default = ["us-east-1a", "us-east-1b"]
}

#public_route_table_CIDR
variable "public_rt" {
    default = "0.0.0.0/0"
}

#public_route_table_CIDR
variable "private_rt" {
    default = "0.0.0.0/0"
}

#security_group mysql_Server
variable "mysqlserver" {
    default = "0.0.0.0/0"
}

#security_group application_server 1 and 2
variable "applicationserver" {
    default = "0.0.0.0/0"
}

variable "alb" {
    default = "0.0.0.0/0"
}

#Instance_count
variable "instance_count" {
    default = "2"
}

#Instance_type
variable "instance_type" {
    default = "t2.micro"
}

#ami_id
variable "ami_id" {
    default = "ami-06ca3ca175f37dd66"
}



