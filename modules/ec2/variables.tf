variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "g4dn.xlarge"
}

variable "key_name" {
  description = "Nome do key pair para acesso SSH"
  type        = string
}

variable "subnet_id" {
  description = "ID da subnet onde a instância será criada"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de Security Groups associados à instância"
  type        = list(string)
}

variable "volume_size" {
  description = "Tamanho do volume raiz em GB"
  type        = number
  default     = 500
}

variable "instance_name" {
  description = "Nome da instância para tagging"
  type        = string
}
