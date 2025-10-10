output "instance_id" {
  description = "EC2 instance id"
  value       = aws_instance.vm.id
}

output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.vm.public_ip
}

output "public_dns" {
  description = "Public DNS name of the instance"
  value       = aws_instance.vm.public_dns
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.vm_sg.id
}