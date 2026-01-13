output "alb_dns_name" {
  description = "Public DNS of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2.instance_id
}
