#target_group
variable "target_group_name" {}
variable "target_type_alb" {}
variable "protocol_alb" {}
variable "port_alb" {}
variable "path_target" {}
variable "vpc_id" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}
variable "interval" {}
variable "port_type_target_alb" {}
variable "target_id_for_instance" {}
variable "targt_group_attachment_portnumber" {}

#application load_balancer
variable "alb_name" {}
variable "ip_address_type" {}
#variable "availability_zone_for_alb" {}
variable "subnet_for_alb" {}
variable "load_balancer_type" {}
variable "security_group_for_alb" {}
variable "alb_listener_portnumber" {}
variable "listener_type" {}























