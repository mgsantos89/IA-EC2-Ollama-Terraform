output "instance_id" {
  description = "ID da instância EC2 criada"
  value       = aws_instance.gpu_instance.id
}

output "public_ip" {
  description = "Endereço IP público da instância"
  value       = aws_instance.gpu_instance.public_ip
}
