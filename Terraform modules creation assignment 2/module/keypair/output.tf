output "bastionkey_output" {
  description = "IDs of the created subnets"
  value       = aws_key_pair.bastionkeypair.id
}