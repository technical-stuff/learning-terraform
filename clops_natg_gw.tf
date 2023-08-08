# NAT_gateway creation
resource "aws_nat_gateway" "clops_natgateway" {
    allocation_id = aws_eip.EIP_natgateway.id
    subnet_id = aws_subnet.clops_public_subnet[0].id
    depends_on = [aws_eip.EIP_natgateway]
    tags = {
        Name = "clops_natgateway"
    }
}