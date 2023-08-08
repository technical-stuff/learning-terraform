#internet_Gateway clops-vpc
resource "aws_internet_gateway" "clops_IGW" {
    vpc_id = aws_vpc.clops_vpc.id
    tags = {
        Name = "clops-igw"
    }
}