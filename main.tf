resource "aws_instance" "wordpress_instance" {
    ami           = "ami-0c55b159cbfafe1f0"  # ID da AMI pública do Ubuntu 20.04 LTS
    instance_type = "t2.micro"
    key_name      = "your-ssh-key"  # Chave SSH

    tags = {
        Name = "MyWordPressInstance"
    }
}

