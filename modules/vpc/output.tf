output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}
output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}
