data "aws_ami" "latest_ubuntu" {
  most_recent = true  # Busca a AMI mais recente

  owners = ["099720109477"]  # ID da Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "gpu_instance" {
  ami                    = data.aws_ami.latest_ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  root_block_device {
    volume_size = var.volume_size
  }

  user_data = <<-EOF
              #!/bin/bash
              # Definir variável HOME para evitar erro do Ollama
              export HOME=/root
              echo "HOME definido como $HOME" | tee -a /var/log/user-data.log
              
              curl -fsSL https://ollama.com/install.sh | sh

              OLLAMA_HOST=0.0.0.0 ollama serve
            
              sleep 30

              # Baixar o modelo
              ollama pull llama3.2:1b | tee -a /var/log/ollama.log
              
              EOF

  tags = {
    Name = var.instance_name
  }
}

# Atraso de 10 minutos após a criação da instância para garantir a instalação do Ollama e da LLM
resource "time_sleep" "wait_for_instance" {
  depends_on = [aws_instance.gpu_instance]
  create_duration = "450s" 
}
