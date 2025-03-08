output "instance_id" {
  description = "ID da instância criada"
  value       = module.ec2_gpu.instance_id
}

output "public_ip" {
  description = "IP público da instância"
  value       = module.ec2_gpu.public_ip
}
