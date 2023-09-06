#bastion_server ec2instance
resource "aws_instance" "bastion_server" {
    count                           = var.instance_count 
    instance_type                   = var.instance_type
    ami                             = var.ami_id
    subnet_id                       = var.subnet_id
    key_name                        = var.key_namepair_bastion
    associate_public_ip_address     = true
    vpc_security_group_ids          = [var.bastion_sg_instance]
    tags = {
      Name = var.instance_name_1
    }
}

#web_server ec2_instance
resource "aws_instance" "application_server" {
    count                           = var.instance_count 
    instance_type                   = var.instance_type
    ami                             = var.ami_id
    subnet_id                       = var.subnet_id_private
    key_name                        = var.key_namepair_bastion
    associate_public_ip_address     = false
    vpc_security_group_ids          = [var.application_server_sg_instance] 
    tags = {
        Name = var.instance_name_2
    }
}

