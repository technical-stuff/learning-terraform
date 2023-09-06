#Bastion_host security_group 
resource "aws_security_group" "bastion_sg" {
    vpc_id = var.vpcid_bastion_sg
    name = "bastion-server-sg"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [ var.bastionserver_sg_ip ]
        protocol = "tcp" 
    }
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = [ var.bastionserver_sg_ip ]
        protocol = "tcp" 
    }
    ingress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ var.bastionserver_sg_ip ]
        protocol = "ICMP" 
    }        
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ var.bastionserver_sg_ip ]
        protocol = -1 
    }
    tags = {
      Name = "bastion-server-sg"
    }
}

#application_server security_group 
resource "aws_security_group" "application_server_sg" {
    vpc_id = var.vpcid_bastion_sg
    name = "application-server-sg"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [ var.applicationserver_sg_ip ]
        protocol = "tcp" 
    }
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = [ var.applicationserver_sg_ip ]
        protocol = "tcp" 
    }
    ingress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ var.applicationserver_sg_ip ]
        protocol = "ICMP" 
    }        
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ var.applicationserver_sg_ip ]
        protocol = -1 
    }
    tags = {
      Name = "application-server-sg"
    }
}

#application_load_balancer security_group
resource "aws_security_group" "alb_sg" {
    vpc_id = var.vpcid_bastion_sg
    name = "application-loadbalancer-sg"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [ var.application_lb_sg_ip ]
        protocol = "tcp" 
    }
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = [ var.application_lb_sg_ip ]
        protocol = "tcp" 
    }      
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ var.application_lb_sg_ip ]
        protocol = -1 
    }
    tags = {
      Name = "application-loadbalancer-sg"
    }
}

#my_sql_server security_group
resource "aws_security_group" "mysql_server_sg" {
    vpc_id = var.vpcid_bastion_sg
    name = "mysql-server-sg"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [ var.application_lb_sg_ip ]
        protocol = "tcp" 
    }
    ingress {
        from_port = 3306
        to_port = 3306
        security_groups = [ aws_security_group.application_server_sg.id ]
        protocol = "tcp" 
    }      
    egress {
        from_port = 0
        to_port = 0
        cidr_blocks = [ var.application_lb_sg_ip ]
        protocol = -1 
    }
    tags = {
      Name = "mysql-server-sg"
    }
}