#VPC_variables

variable "myvpc" {}
variable "myvpcname" {}
variable "public_subnet" {}
variable "private_subnet" {}
variable "availability_zone_name" {}
variable "public_rt_ip" {}
variable "private_rt_ip" {}
variable "igw_name" {}
variable "EIP_name" {}
variable "gateway_name" {}

#Bastion_host public_server

variable "instance_count" {} 
variable "instance_type" {}
variable "ami_id" {}
variable "instance_name_1" {}
variable "instance_name_2" {}

#keypair for bastion_host public_server
variable "key_namepair" {}
variable "key_namepair_local" {}

#security_group for bastionhost_server and application_server
variable "bastionserver_sg_ip" {}
variable "applicationserver_sg_ip" {}
variable "application_lb_sg_ip" {}

#sns_topic for appliation_server
variable "sns_name" {}
variable "protocol_type" {}
variable "email_id" {}

#cloudwatch creation for application_server
variable "alarm_name" {}
variable "metric_name" {}
variable "namespace" {}
variable "period" {}
variable "statistic" {}
variable "comparison_operator" {}
variable "evaluation_periods" {}
variable "threshold" {}

#target_group
variable "target_group_name" {}
variable "target_type_alb" {}
variable "protocol_alb" {}
variable "port_alb" {}
variable "path_target" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}
variable "interval" {}
variable "port_type_target_alb" {}
variable "targt_group_attachment_portnumber" {}

#application load_balancer
variable "alb_name" {}
variable "ip_address_type" {}
//variable "availability_zone_for_alb" {}
variable "load_balancer_type" {}
variable "alb_listener_portnumber" {}
variable "listener_type" {}

#mysql_server database
variable "mysql_database_name" {}
variable "engine_type" {}
variable "engine_version" {}
variable "username" {}
variable "password" {}
variable "instance_class" {}
variable "storage_type" {}
variable "allocated_storage" {}
//variable "parameter_group_name" {}
variable "db_subnet_group_name" {}











