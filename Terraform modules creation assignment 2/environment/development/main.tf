provider "aws" {
    region                      = "us-east-1" 
}

#VPC creation
module "my-vpc" {
    source                      = "../../module/VPC"
    myvpcname                   = var.myvpcname
    igw_name                    = var.igw_name
    EIP_name                    = var.EIP_name
    gateway_name                = var.gateway_name
    myvpc                       = var.myvpc
    public_subnet               = var.public_subnet
    private_subnet              = var.private_subnet
    availability_zone_name      = var.availability_zone_name
    public_rt_ip                = var.public_rt_ip
    private_rt_ip               = var.private_rt_ip
}

#Bastion_host server and application_server ec2_instance
module "ec2_webapplication" {
    source                          = "../../module/Instance"
    instance_name_1                 = var.instance_name_1
    instance_name_2                 = var.instance_name_2
    instance_count                  = var.instance_count
    instance_type                   = var.instance_type
    ami_id                          = var.ami_id
    subnet_id                       = module.my-vpc.public_subnet_ids[0]
    key_namepair_bastion            = module.bastion_keypair.bastionkey_output
    bastion_sg_instance             = module.bastion_sg.bastion_sg_output
    subnet_id_private               = module.my-vpc.private_subnet_ids[0]
    application_server_sg_instance  = module.bastion_sg.application_sg_output
}

#kaypairs_for servers
module "bastion_keypair" {
    source                      = "../../module/keypair"
    key_namepair                = var.key_namepair
    key_namepair_local          = var.key_namepair_local
}

#security_group for bastion_servers and application_server
module "bastion_sg" {
    source                      = "../../module/security_group"
    vpcid_bastion_sg            = module.my-vpc.vpc_id
    bastionserver_sg_ip         = var.bastionserver_sg_ip
    applicationserver_sg_ip     = var.applicationserver_sg_ip
    application_lb_sg_ip        = var.application_lb_sg_ip
  
}

#sns_module
module "sns_module" {
    source                      = "../../module/sns_topic"
    sns_name                    = var.sns_name
    protocol_type               = var.protocol_type
    email_id                    = var.email_id  
}

#cloudwatch_module creation
module "cloudwatch_module" {
    source                      = "../../module/cloudwatch"
    alarm_name                  = var.alarm_name
    metric_name                 = var.metric_name
    namespace                   = var.namespace
    period                      = var.period
    statistic                   = var.statistic
    comparison_operator         = var.comparison_operator
    evaluation_periods          = var.evaluation_periods
    threshold                   = var.threshold
    alarm_actions_from_sns      = module.sns_module.sns_arn_output
    instanceid_cloudwatch       = module.ec2_webapplication.applicationserver_output[0]
}

#alb_module creation
module "alb_module" {
    #targer_group_creation
    source                                  = "../../module/alb"
    target_group_name                       = var.target_group_name
    target_type_alb                         = var.target_type_alb
    protocol_alb                            = var.protocol_alb
    port_alb                                = var.port_alb
    path_target                             = var.path_target
    vpc_id                                  = module.my-vpc.vpc_id  
    healthy_threshold                       = var.healthy_threshold
    unhealthy_threshold                     = var.unhealthy_threshold
    interval                                = var.interval
    port_type_target_alb                    = var.port_type_target_alb
    target_id_for_instance                  = module.ec2_webapplication.applicationserver_output[0]
    targt_group_attachment_portnumber       = var.targt_group_attachment_portnumber

    #alb_creation
    alb_name                                = var.alb_name
    ip_address_type                         = var.ip_address_type
    //availability_zone_for_alb               = 
    subnet_for_alb                          = module.my-vpc.public_subnet_ids[*]
    load_balancer_type                      = var.load_balancer_type
    security_group_for_alb                  = module.bastion_sg.application_load_sg_output
    alb_listener_portnumber                 = var.alb_listener_portnumber
    listener_type                           = var.listener_type
}

#RDS_module
module "my_sql_rds" {
    source                          = "../../module/rds"
    mysql_database_name             = var.mysql_database_name
    engine_type                     = var.engine_type
    engine_version                  = var.engine_version
    username                        = var.username
    password                        = var.password
    instance_class                  = var.instance_class
    storage_type                    = var.storage_type
    allocated_storage               = var.allocated_storage
    //parameter_group_name            = var.parameter_group_name
    subnet_ids_for_mysqlserver      = module.my-vpc.private_subnet_ids[*]
    vpc_id_mysql_server             = module.my-vpc.vpc_id
    mysql_server_sg                 = [module.bastion_sg.mysql_server_sg_output]
    db_subnet_group_name            = var.db_subnet_group_name 
}






