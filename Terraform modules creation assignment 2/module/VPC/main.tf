#create a vpc
resource "aws_vpc" "VPC" {
    cidr_block          = var.myvpc
    tags = {
      Name = var.myvpcname
    }
}

#Public_subnet creation 
resource "aws_subnet" "my_public_subnet" {
    vpc_id              = aws_vpc.VPC.id
    count               = length(var.public_subnet)
    cidr_block          = element(var.public_subnet,count.index)
    availability_zone   = element(var.availability_zone_name,count.index)
    tags = {
        Name = "Public-subnet-${count.index + 1}"
    }
}

#private_subnet creation 
resource "aws_subnet" "my_private_subnet" {
    vpc_id              = aws_vpc.VPC.id
    count               = length(var.private_subnet)
    cidr_block          = element(var.private_subnet,count.index)
    availability_zone   = element(var.availability_zone_name,count.index)
    tags = {
        Name = "Private-subnet-${count.index + 1}"
    }
}

#Internet_gateway creation
resource "aws_internet_gateway" "my_igw" {
    vpc_id              = aws_vpc.VPC.id
    tags = {
      Name = var.igw_name
    }
}

#Public_route_table creation
resource "aws_route_table" "public_rt" {
    vpc_id              = aws_vpc.VPC.id
    route {
        cidr_block      = var.public_rt_ip
        gateway_id      = aws_internet_gateway.my_igw.id
    }
    tags = {
      Name = "PublicRT"
    }
}

#public route_table with public_subnet_association
resource "aws_route_table_association" "public_rt_assocation" {
    count               = length(var.public_subnet)
    subnet_id           = element(aws_subnet.my_public_subnet[*].id,count.index)
    route_table_id      = aws_route_table.public_rt.id
}

#For Nat_EIP creation 
resource "aws_eip" "my_eip" {
    vpc                 = true
    tags = {
      Name = var.EIP_name
    }
}


#Nat_gateway creation
resource "aws_nat_gateway" "my_natgateway" {
    depends_on          = [ aws_eip.my_eip ]
    allocation_id       = aws_eip.my_eip.id
    subnet_id           = aws_subnet.my_public_subnet[0].id
    tags = {
      Name = var.gateway_name
    }
}

#private_route_table creation
resource "aws_route_table" "Private_rt" {
    vpc_id              = aws_vpc.VPC.id
    route {
        cidr_block      = var.private_rt_ip
        nat_gateway_id  = aws_nat_gateway.my_natgateway.id 
    }
    tags = {
        Name = "PrivateRT"
    }
}


#private_route_table with private subnet_assocaition
resource "aws_route_table_association" "private_rt_association" {
    count               = length(var.private_subnet)
    subnet_id           = element(aws_subnet.my_private_subnet[*].id,count.index)
    route_table_id      = aws_route_table.Private_rt.id
}




