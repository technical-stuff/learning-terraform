#VPC details

clops-vpc_ip = "10.0.0.0/16"
public_subnet_cidr =  ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zone_name = ["us-east-1a", "us-east-1b"]
public_rt = "0.0.0.0/0"
private_rt = "0.0.0.0/0"

#instance_details

instance_type = "t2.micro"
instance_count = "2"
ami_id = "ami-06ca3ca175f37dd66"
applicationserver_port = "0.0.0.0/0"
clops_private_subnet = ["10.0.3.0/24", "10.0.4.0/24"]

