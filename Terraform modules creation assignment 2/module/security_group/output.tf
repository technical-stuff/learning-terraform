#bastion_server security_group output
output "bastion_sg_output" {
    value = aws_security_group.bastion_sg.id 
}

#application_server security_group output
output "application_sg_output" {
    value = aws_security_group.application_server_sg.id 
}

#application_load_balancer security_group output
output "application_load_sg_output" {
    value = aws_security_group.alb_sg.id
}

#mysql_server security_group output
output "mysql_server_sg_output" {
    value = aws_security_group.mysql_server_sg.id
}

