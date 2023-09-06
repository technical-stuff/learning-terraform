#application_server ec2 creation
resource "aws_instance" "application_server1" {
    count = var.instance_count
    instance_type = var.instance_type
    key_name = aws_key_pair.application1_keypair.key_name
    ami = var.ami_id
    availability_zone = element(var.availability_zone_name, count.index)
    #subnet_id = element(aws_subnet.clops_private_subnet[*].id, count.index)
    subnet_id = var.clops_private_subnet
    associate_public_ip_address = false
    vpc_security_group_ids = [aws_security_group.application_server_sg.id]
    tags = {
        Name = "application-server-${count.index + 1}"
    }
}

#aws_keypair_applicationServer1_private
resource "tls_private_key" "application1" {
    algorithm = "RSA"
    rsa_bits = 4096
}
resource "aws_key_pair" "application1_keypair" {
    key_name = "application1pemfile"
    public_key = tls_private_key.application1.public_key_openssh
}
resource "local_file" "application1pemfile" {
    filename = "application1pemfile"
    content = tls_private_key.application1.private_key_pem
}

#security_group application_server_1 and application_server_2 server
resource "aws_security_group" "application_server_sg" {
    #vpc_id = aws_vpc.clops_vpc.id
    name = "application-server-sg"
    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = [var.applicationserver_port]
        protocol = "tcp"

    }
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = [var.applicationserver_port]
        protocol = "tcp"

    }
    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "ICMP"
        cidr_blocks = [var.applicationserver_port]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.applicationserver_port]
    }
    tags = {
      Name = "application-server-sg"
    }  
}
