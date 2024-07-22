variable "aws_access_key" {}
variable "aws_secret_access_key" {}

provider "aws" {
    access_key = "your_access_key" # Insira sua chave de acesso
    secret_key = "your_secret_key" # Insira sua chave de acesso secreta
    region     = "us-east-2"  # Insira a sua região
}
