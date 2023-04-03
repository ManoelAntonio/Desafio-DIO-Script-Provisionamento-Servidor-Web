# Define o provedor de infraestrutura
provider "aws" {
  region = "us-west-2"
}

# Cria uma instância EC2
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  # Configuração do Apache
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF

  tags = {
    Name = "webserver"
  }
}

# Abre o acesso à porta 80
resource "aws_security_group" "web" {
  name = "web"
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Associa a instância EC2 ao grupo de segurança
  tags = {
    Name = "webserver"
  }

  # Referencia a instância EC2 criada anteriormente
  depends_on = [aws_instance.web]
}
