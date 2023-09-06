#vpc_id output
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.VPC.id
}

#public_subnet ID output
output "public_subnet_ids" {
  description = "IDs of the created subnets"
  value       = aws_subnet.my_public_subnet[*].id
}

#Private_subnet ID output
output "private_subnet_ids" {
  description = "IDs of the created subnets"
  value       = aws_subnet.my_private_subnet[*].id 
}