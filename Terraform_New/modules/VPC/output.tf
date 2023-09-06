output "public_subnet_output" {
    value = var.public_subnet_cidr
}

output "vpc_output" {
  value = aws_vpc.clops_vpc.id
}

