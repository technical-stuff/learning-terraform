#VPC
resource "aws_vpc" "clops_vpc" {
    cidr_block = var.clops-vpc_ip
    tags = {
        Name = "clops-vpc"
    }
}

#Public_subnet for clops-vpc

resource "aws_subnet" "clops_public_subnet" {
    vpc_id = aws_vpc.clops_vpc.id 
    count = length(var.public_subnet_cidr)
    cidr_block = element(var.public_subnet_cidr,count.index)
    availability_zone = element(var.availability_zone_name,count.index) 
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

#public route_table creation
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.clops_vpc.id
    route{
        cidr_block = var.public_rt
        gateway_id = aws_internet_gateway.clops_IGW.id
    }
    tags = {
        Name = "Public_RT"
    }
}


#public route_table subnet_association
resource "aws_route_table_association" "public_rt_association" {
    count = length(var.public_subnet_cidr)
    subnet_id = element(aws_subnet.clops_public_subnet[*].id, count.index)
    route_table_id = aws_route_table.public_route_table.id
} 


#private route_table creation
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.clops_vpc.id
    route{
        cidr_block = var.private_rt
        nat_gateway_id = aws_nat_gateway.clops_natgateway.id
    }
    tags = {
        Name = "Private_RT"
    }
}


#private route_table subnet_association
resource "aws_route_table_association" "private_rt_association" {
    count = length(var.private_subnet_cidr)
    subnet_id = element(aws_subnet.clops_private_subnet[*].id, count.index)
    route_table_id = aws_route_table.private_route_table.id
} 

resource "aws_internet_gateway" "clops_IGW" {
    vpc_id = aws_vpc.clops_vpc.id
    tags = {
        Name = "clops-igw"
    }
}

resource "aws_nat_gateway" "clops_natgateway" {
    allocation_id = aws_eip.EIP_natgateway.id
    subnet_id = aws_subnet.clops_public_subnet[0].id
    depends_on = [aws_eip.EIP_natgateway]
    tags = {
        Name = "clops_natgateway"
    }
}

resource "aws_eip" "EIP_natgateway" {
    vpc = true
    tags = {
        Name = "EIPNATGwclops"
    }
}
