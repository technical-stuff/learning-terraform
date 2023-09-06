#VPC
myvpc                       = "10.0.0.0/16"
myvpcname                   = "development-vpc"
igw_name                    = "MyIGW-dev"
EIP_name                    = "MyEIP-dev"
gateway_name                = "My-gateway-dev"
public_subnet               = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet              = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zone_name      = ["us-east-1a", "us-east-1b"]
public_rt_ip                = "0.0.0.0/0"
private_rt_ip               = "0.0.0.0/0"

#Bastion_host server
instance_count              = "1"
instance_type               = "t2.micro" 
ami_id                      = "ami-0261755bbcb8c4a84"
instance_name_1             = "bastion-server-dev"
instance_name_2             = "application-server-dev"

#bastion_server pem_file
key_namepair                = "bastionpemfile"
key_namepair_local          = "bastionpemfile"

#bastionhost_server security_group IP and application_server security_group IP
bastionserver_sg_ip         = "0.0.0.0/0"
applicationserver_sg_ip     = "0.0.0.0/0"
application_lb_sg_ip        = "0.0.0.0/0"

#sns_topic creation for instance to monitor cpu_utilization
sns_name                    = "Webserver_Email_Notification_for_cpu"
protocol_type               = "email"
email_id                    = "praveen.ravi@cloudifyops.com"

#cloudwatch to monitor the application_server instance
alarm_name                  = "InstanceCheck-CPUUtilization"
metric_name                 = "CPUUtilization"
namespace                   = "AWS/EC2"
period                      = "300"
statistic                   = "Average"
comparison_operator         = "GreaterThanOrEqualToThreshold"
evaluation_periods          = "1"
threshold                   = "20"

#target_group_alb
target_group_name                       = "application-target-group"
target_type_alb                         = "instance"
protocol_alb                            = "HTTP"
port_alb                                = "80"
path_target                             = "/"
healthy_threshold                       = 2
unhealthy_threshold                     = 2
interval                                = 10
port_type_target_alb                    = "traffic-port"
targt_group_attachment_portnumber       = 80
#alb
alb_name                                = "application-lb"
ip_address_type                         = "ipv4"
load_balancer_type                      = "application"
alb_listener_portnumber                 = 80
listener_type                           = "forward"

#mysql_server_creation
mysql_database_name     = "mysql_server_rds"
engine_type             = "mysql"
engine_version          = "8.0.31"
username                = "admin"
password                = "Passwoed123"
instance_class          = "db.t2.micro"
storage_type            = "gp2"
allocated_storage       = 100
//parameter_group_name    = "mysql8.0"
db_subnet_group_name    = "db_subnet_group_name"









