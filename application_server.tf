#application_server ec2 creation
resource "aws_instance" "application_server1" {
    count = var.instance_count
    instance_type = var.instance_type
    key_name = aws_key_pair.application1_keypair.key_name
    ami = var.ami_id
    availability_zone = element(var.availability_zone_name, count.index)
    subnet_id = element(aws_subnet.clops_private_subnet[*].id, count.index)
    associate_public_ip_address = false
    vpc_security_group_ids = [aws_security_group.application_server_sg.id]
    tags = {
        Name = "application-server-${count.index + 1}"
    }
}
