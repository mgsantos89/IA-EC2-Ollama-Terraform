variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
  default     = "IaServer-KEY"
}

variable "vpc_id" {
  description = "ID da VPC onde será criado o Security Group"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet onde a instância será criada"
  type        = string
}

variable "volume_size" {
  description = "Tamanho do volume raiz em GB"
  type        = number
}

variable "instance_name" {
  description = "Nome da instância para tagging"
  type        = string
}
