# Contém a configuração principal do Terraform, definindo os recursos que desejamos criar ou gerenciar na AWS.


resource "aws_instance" "wordpress_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # ID da AMI pública do Ubuntu 20.04 LTS
  instance_type = "t2.micro"
  key_name      = "your_ssh_key" # Chave SSH

  user_data = <<-EOF
        #!/bin/bash
        # Atualizar o sistema
        apt update -y
        apt upgrade -y

        # Instalar Docker
        apt install -y docker.io

        # Iniciar e habilitar o Docker
        systemctl start docker
        systemctl enable docker

        # Instalar Docker Compose
        curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose

        # Configurar o Docker Compose
        mkdir /home/ubuntu/app
        cd /home/ubuntu/app
        cat <<EOL > docker-compose.yml
        version: '3'
        services:
          wordpress:
            image: wordpress
            ports:
              - "80:80"
            environment:
              WORDPRESS_DB_HOST: db:3306
              WORDPRESS_DB_USER: root
              WORDPRESS_DB_PASSWORD: GAud4mZby8F3SD6P
            volumes:
              - wordpress_data:/var/www/html
          db:
            image: mysql:5.7
            environment:
              MYSQL_ROOT_PASSWORD: GAud4mZby8F3SD6P
            volumes:
              - db_data:/var/lib/mysql
        volumes:
          wordpress_data:
          db_data:
        EOL

        # Iniciar o Docker Compose
        docker-compose up -d
    EOF

  tags = {
    Name = "MyWordPressInstance"
  }
}

output "public_ip" {
  value = aws_instance.wordpress_instance.public_ip
}
