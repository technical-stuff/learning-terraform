#my_sqldatabase variavle
variable "mysql_database_name" {}
variable "engine_type" {}
variable "engine_version" {}
variable "username" {}
variable "password" {}
variable "instance_class" {}
variable "storage_type" {}
variable "allocated_storage" {}
//variable "parameter_group_name" {}
variable "vpc_id_mysql_server" {}
variable "mysql_server_sg" {}
variable "subnet_ids_for_mysqlserver" {
    type = list(string) 
}
variable "db_subnet_group_name" {}

