#security_group application_server_1 and application_server_2 server
resource "aws_security_group" "application_server_sg" {
    vpc_id = aws_vpc.clops_vpc.id
    name = "application-server-sg"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [var.applicationserver]
        protocol = "tcp"

    }
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = [var.applicationserver]
        protocol = "tcp"

    }
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "ICMP"
        cidr_blocks = [var.applicationserver]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.applicationserver]
    }
    tags = {
      Name = "application-server-sg"
    }  
}


#security_group for mysql_server
resource "aws_security_group" "Mysqlserver_sg" {
    vpc_id = aws_vpc.clops_vpc.id
    name = "Mysqlserver_Sg"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [var.mysqlserver]
        protocol = "tcp"

    }
    ingress {
        from_port = 3306
        to_port = 3306
        security_groups = [aws_security_group.application_server_sg.id]
        protocol = "tcp"

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.mysqlserver]
    }
    tags = {
      Name = "mysqlserver_sg"
    }  
}

# Create a security group for the ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-security-group"
  description = "Security group for the ALB"
  # Allow inbound HTTP and HTTPS traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.alb]
  }
  # Allow outbound traffic to the application servers
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.alb]  # Replace with your application server's CIDR block
  }
}