#RDS creation
resource "aws_db_instance" "Mysql_database" {
    db_name                 = var.mysql_database_name
    engine                  = var.engine_type
    engine_version          = var.engine_version
    multi_az                = false
    username                = var.username
    password                = var.password
    instance_class          = var.instance_class
    storage_type            = var.storage_type
    allocated_storage       = var.allocated_storage 
    //parameter_group_name    = var.parameter_group_name
    db_subnet_group_name    = aws_db_subnet_group.mysql_db_subnet_group.id 
    //vpc_id                  = var.vpc_id_mysql_server
    vpc_security_group_ids  = var.mysql_server_sg
    publicly_accessible     = false
    skip_final_snapshot     = true
    backup_retention_period = 7 
}

#DB_subnet group for mysql_server
resource "aws_db_subnet_group" "mysql_db_subnet_group" {
    name                    = var.db_subnet_group_name
    subnet_ids              = var.subnet_ids_for_mysqlserver
    tags = {
        Name = "Mysql_database_subnet_group_name"
    }   
}

# #DB_parameter_group for mysql_server
# resource "aws_db_parameter_group" "mysql_server_parameter_group" {
#   name        = var.parameter_name
#   family      = var.parameter_family
#   description = "Parameter group for MySQL 8.0"

#   parameter {
#     name  = "parameter_name"
#     value = "parameter_value"
#   }
#   # Add any other parameters you need here.
# }