#create module for vpc
provider "aws" {}

module "vpc" {
    source = "./modules/VPC"
    clops-vpc_ip = var.clops-vpc_ip
    public_subnet_cidr =  var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
    availability_zone_name = var.availability_zone_name
    public_rt = var.public_rt
    private_rt = var.private_rt  
}

module "ec2_instance" {
    source = "./modules/Instance"
    vpc_output = module.vpc.vpc_output
    instance_count = var.instance_count
    instance_type = var.instance_type
    ami_id = var.ami_id
    #private_subnet_output = module.vpc.private_subnet_output
    clops_private_subnet = var.clops_private_subnet
    applicationserver_port = var.applicationserver_port
    availability_zone_name = var.availability_zone_name
}

