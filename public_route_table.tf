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
