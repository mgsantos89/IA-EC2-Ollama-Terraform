output "key_name" {
  value = aws_key_pair.generated_key.key_name
}

output "private_key_path" {
  value = "${path.module}/${var.key_name}.pem"
}
