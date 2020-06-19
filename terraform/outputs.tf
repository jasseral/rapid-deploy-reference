output "instance_ip_addr_worker_1" {
  value       = aws_instance.worker_1.public_ip
  description = "The private IP address of the main server instance."
}