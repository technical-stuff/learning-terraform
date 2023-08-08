#Public_subnet for clops-vpc

resource "aws_subnet" "clops_public_subnet" {
    vpc_id = aws_vpc.clops_vpc.id 
    count = length(var.public_subnet_cidr)
    cidr_block = element(var.public_subnet_cidr, count.index)
    availability_zone = element(var.availability_zone_name, count.index) 
    tags = {
        Name = "clops-public-subnet-${count.index + 1}"
    }
}


#Private_subnet

resource "aws_subnet" "clops_private_subnet" {
    vpc_id = aws_vpc.clops_vpc.id
    count = length(var.private_subnet_cidr)
    cidr_block = element(var.private_subnet_cidr,count.index)
    availability_zone = element(var.availability_zone_name,count.index)
    tags = {
        Name = "clops-private-subnet-${count.index + 1}"
    }
}

