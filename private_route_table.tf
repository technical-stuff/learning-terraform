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
