#EIP for NAT_gateway
resource "aws_eip" "EIP_natgateway" {
    vpc = true
    tags = {
        Name = "EIPNATGwclops"
    }
}