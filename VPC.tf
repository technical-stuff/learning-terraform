#VPC
resource "aws_vpc" "clops_vpc" {
    cidr_block = var.clops-vpc_ip
    tags = {
        Name = "clops_vpc"
    }
}
